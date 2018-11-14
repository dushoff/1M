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

clonedirs += Lectures tests
contents = Lectures Archive
contents: $(contents)

$(contents):
	git clone https://github.com/Bio1M/$@ 

### Test material. Not sure why it's named 2017; was I planning to open it?
tests:
	git clone https://dushoff@bitbucket.org/dushoff/1m_2017.git $@

######################################################################

screen_session: Lectures.screen web.screen tests.screen

web.screen:
	cd Lectures/web && screen -t "lweb"

%.screen: %
	cd $< && screen -t "$<"

### Makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk

# -include $(ms)/wrapR.mk

