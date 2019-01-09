rm -rf _posts/*
find . -name "*.org" | while read -r filename; do
    newfilename=$(echo $filename | sed -e "s_\(\.\/\)\(\.orgsource\/\)\(.*\)\(.org\)_\1\3\.html_g")
    pandoc -t html -o $newfilename $filename
done
jekyll $1
