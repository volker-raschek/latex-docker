# CONTAINER_RUNTIME
# The CONTAINER_RUNTIME variable will be used to specified the path to a
# container runtime. This is needed to start and run a container image.
CONTAINER_RUNTIME?=$(shell which podman)

# ArchLinux
LATEX_IMAGE_REGISTRY_HOST?=git.cryptic.systems
LATEX_IMAGE_REGISTRY_USER?=volker.raschek
LATEX_IMAGE_NAMESPACE?=${LATEX_IMAGE_REGISTRY_USER}
LATEX_IMAGE_REPOSITORY:=latex
LATEX_IMAGE_VERSION?=latest
LATEX_IMAGE_FULLY_QUALIFIED=${LATEX_IMAGE_REGISTRY_HOST}/${LATEX_IMAGE_NAMESPACE}/${LATEX_IMAGE_REPOSITORY}:${LATEX_IMAGE_VERSION}

# BUILD LATEX CONTAINER IMAGE
# ==============================================================================
PHONY:=container-image/build/arch-linux
container-image/build/arch-linux:
	${CONTAINER_RUNTIME} build \
		--file Dockerfile.archlinux \
		--no-cache \
		--pull \
		--tag ${LATEX_IMAGE_FULLY_QUALIFIED} \
		.

# DELETE LATEX CONTAINER IMAGE
# ==============================================================================
PHONY:=container-image/delete/arch-linux
container-image/delete/arch-linux:
	- ${CONTAINER_RUNTIME} image rm ${LATEX_IMAGE_FULLY_QUALIFIED}

# PUSH LATEX CONTAINER IMAGE
# ==============================================================================
PHONY+=container-image/push/arch-linux
container-image/push/arch-linux:
	echo ${LATEX_IMAGE_REGISTRY_PASSWORD} | ${CONTAINER_RUNTIME} login ${LATEX_IMAGE_REGISTRY_HOST} --username ${LATEX_IMAGE_REGISTRY_USER} --password-stdin
	${CONTAINER_RUNTIME} push ${LATEX_IMAGE_FULLY_QUALIFIED}

# PHONY
# ==============================================================================
# Declare the contents of the PHONY variable as phony.  We keep that information
# in a variable so we can use it in if_changed.
.PHONY: ${PHONY}
