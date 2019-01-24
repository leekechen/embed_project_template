suffix_type := *.c *.cpp *.s

sources := $(foreach dir, $(SOURCES_DIR), $(wildcard $(addprefix $(dir)/*,$(suffix_type))))
ojbects := $(addsuffix .o, $(basename $(sources)))
depends := $(addsuffix .d, $(basename $(sources)))

CFLAGS  += $(INCLUDE_DIR)

.PHONY: all clean cleanall $(SUB_DIRS)

all :  $(SUB_DIRS) $(ojbects) $(depends) install $($(TARGET)


clean : $(SUB_DIRS)
	@rm -rf $(ojbects)
	
distclean : $(SUB_DIRS)
	@rm -rf $(ojbects)
	@rm -rf $(depends)
	
install :

dist :


$(SUB_DIRS) : 
	@make -C $@ $(MAKECMDGOALS)
	
$(TARGET) : $(LIBS) $(ojbects) $(depends)
	@$(LD) $(LDFLAGS) $@
                
%.d : %.c
	@$(CC) -MM -MD  $< $(CFLAGS)
	
%.d : %.cpp
	@$(CXX) -MM -MD $<  $(CFLAGS)  		
	
%.d : %.s
	@$(CC) -MM -MD   $<		 $(CFLAGS)