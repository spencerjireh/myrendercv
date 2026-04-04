OUTPUT = rendercv_output
NAME = Spencer_Jireh_Cebrian
PUBLIC_TARGETS = base backend fullstack ai go

.PHONY: all public $(PUBLIC_TARGETS) clean

all: public

public: $(PUBLIC_TARGETS)

base:
	uv run rendercv render Spencer_Jireh_Cebrian_CV.yaml \
		-pdf $(OUTPUT)/$(NAME)_CV.pdf \
		-png $(OUTPUT)/$(NAME)_CV.png \
		-nomd

backend:
	uv run rendercv render Spencer_Jireh_Cebrian_Backend_CV.yaml \
		-pdf $(OUTPUT)/$(NAME)_Backend_CV.pdf \
		-png $(OUTPUT)/$(NAME)_Backend_CV.png \
		-nomd

fullstack:
	uv run rendercv render Spencer_Jireh_Cebrian_Fullstack_CV.yaml \
		-pdf $(OUTPUT)/$(NAME)_Fullstack_CV.pdf \
		-png $(OUTPUT)/$(NAME)_Fullstack_CV.png \
		-nomd

ai:
	uv run rendercv render Spencer_Jireh_Cebrian_AI_Engineer_CV.yaml \
		-pdf $(OUTPUT)/$(NAME)_AI_Engineer_CV.pdf \
		-png $(OUTPUT)/$(NAME)_AI_Engineer_CV.png \
		-nomd

go:
	uv run rendercv render Spencer_Jireh_Cebrian_Go_Dev_CV.yaml \
		-pdf $(OUTPUT)/$(NAME)_Go_Dev_CV.pdf \
		-png $(OUTPUT)/$(NAME)_Go_Dev_CV.png \
		-nomd

-include private/Makefile.private

clean:
	rm -rf $(OUTPUT)/
