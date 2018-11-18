# 1M
### Hooks for the editor to set the default target

current: target
-include target.mk

##################################################################

## Defs

# stuff

Sources += Makefile .ignore 
Ignore += .gitignore

msrepo = https://github.com/dushoff
ms = makestuff
Ignore += local.mk
-include local.mk
-include $(ms)/os.mk

# -include $(ms)/perl.def

Ignore += $(ms)
## Sources += $(ms)
Makefile: $(ms) $(ms)/Makefile
$(ms):
	git clone $(msrepo)/$(ms)

## Only meant to work with makestuff.sub
$(ms)/%.mk: $(ms) $(ms)/Makefile ;

######################################################################

## Cloned repos

contents = Lectures Archive Tests
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

web.screen:
	cd Lectures/web && screen -t "lweb"

%.screen: %
	cd $< && screen -t "$<"

### Makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk

# -include $(ms)/wrapR.mk

