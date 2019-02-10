git clean -df
mkdir _posts
find ./_orgsource -name "*.org" | while read -r filename; do
    sed -e 's/\(\#\+BEGIN\_SRC \)\(.*\)/\#\+BEGIN_HTML\
{\% highlight \2 \%}/' -e 's/\#\+END\_SRC/{\% endhighlight \%}\
\#\+END_HTML/' $filename > $filename.temp.org
    newfilename=$(echo $filename | sed -e "s/\(\.\/\)\(\_orgsource\/\)\(.*\)\(.org\)/\1\3\.html/g")
    pandoc -t html -o $newfilename $filename.temp.org
    rm $filename.temp.org
done
cp ./_orgsource/images/* ./assets/images/
bundle exec jekyll $@
