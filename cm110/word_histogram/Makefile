#all: histogram.tsv

#clean:
	#rm -f words.txt

#all: histogram.png words.text
all: report.html

clean:
	rm -f histogram.png

words.txt:
	Rscript -e 'download.file("https://svnweb.freebsd.org/base/head/share/dict/web2?view=co", destfile = "words.txt", quiet = TRUE)'
	
	#to instruct the Rscript to remake the graph when the raw data changes. 
	#"re-make histogram.tsv when words text changes 
	#$< means to refer to the 1st dependencies. TO avoid error in file name or duplication"
	
	
histogram.tsv: histogram.R words.txt
	Rscript $<
	
	#all: histogram.tsv

#clean:
#	rm -f words.txt histogram.tsv

#to create a plot. to  have more than 1 line in rcode, separate by ;
#$@ short hand for what is wanted. eg histogram.png
#any changes made, update all: and clean:

#histogram.png: histogram.tsv
	Rscript -e 'library(ggplot2); qplot(Length, Freq, data=read.delim("$<")); ggsave("$@")'
	#rm -f command can also be here to clean
	
report.html: histogram.tsv
	Rscript -e 'library(ggplot2); qplot(Length, Freq, data=read.delim("$<")); ggsave("$@")'
	