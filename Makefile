.PHONY: all verify

all: an-duong-software-engineer-resume.pdf an-duong-fullstack-engineer-resume.pdf an-duong-mobile-engineer-resume.pdf

an-duong-software-engineer-resume.pdf: resume.html resume.css resume-software.css
	weasyprint --stylesheet resume-software.css resume.html $@

an-duong-fullstack-engineer-resume.pdf: resume.html resume.css resume-fullstack.css
	weasyprint --stylesheet resume-fullstack.css resume.html $@

an-duong-mobile-engineer-resume.pdf: resume.html resume.css resume-mobile.css
	weasyprint --stylesheet resume-mobile.css resume.html $@

verify: all
	@test "$$(pdfinfo an-duong-software-engineer-resume.pdf | awk '/^Pages:/ {print $$2}')" = "1"
	@test "$$(pdfinfo an-duong-fullstack-engineer-resume.pdf | awk '/^Pages:/ {print $$2}')" = "1"
	@test "$$(pdfinfo an-duong-mobile-engineer-resume.pdf | awk '/^Pages:/ {print $$2}')" = "1"
