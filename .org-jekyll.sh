rm -rf _posts/*
find ./.orgsource -name "*.org" | while read -r filename; do
    sed -e 's/\(\#\+BEGIN\_SRC \)\(.*\)/\#\+BEGIN_HTML\
{\% highlight \2 \%}/' -e 's/\#\+END\_SRC/{\% endhighlight \%}\
\#\+END_HTML/' $filename > $filename.temp.org
    newfilename=$(echo $filename | sed -e "s_\(\.\/\)\(\.orgsource\/\)\(.*\)\(.org\)_\1\3\.html_g")
    pandoc -t html -o $newfilename $filename.temp.org
    rm $filename.temp.org
done
jekyll $1
