# 1M
### Container: Only one real file (notes.md)

current: target
-include target.mk

##################################################################

# stuff

Sources += notes.md

Sources += Makefile 
Ignore += .gitignore

msrepo = https://github.com/dushoff
ms = makestuff
-include $(ms)/os.mk

# -include $(ms)/perl.def

Ignore += $(ms)
Makefile: $(ms) $(ms)/Makefile
$(ms)/Makefile:
	git clone $(msrepo)/$(ms)

######################################################################

## Cloned repos

## contents should only include things whose names match
contents = Lectures Archive 
contents: $(contents)
clonedirs += Lectures
clonedirs += Tests
Ignore += Archive

## Archive is meant as a repo for old test material. Not sure why it's necessary (instead of sharing by web and using version control ...)

$(contents):
	git clone https://github.com/Bio1M/$@ 

### Test material. Recently renamed 2018 Nov 18 (Sun)
Tests:
	git clone https://dushoff@bitbucket.org/dushoff/1m_private.git $@
Ignore += tests ## Delete soon 2018 Nov 18 (Sun)

######################################################################

screen_session: Lectures.screen web.screen Tests.screen

web.screen: Lectures Lectures/web
	cd Lectures/web && screen -t "lweb" bash -cl "vmt index.md" ##

%.screen: %
	cd $< && screen -t "$<" bash -cl "vmt" ##

### Makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk

# -include $(ms)/wrapR.mk

