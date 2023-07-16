<div align="center">

# りれきしょ / rirekisho

</div>

Repository of my resumes. Comes with script to generate LaTeX from json data file.

## USAGE

Output generated LaTeX resume to stdout
```sh
./rirekisho.rb <data-file>
```

## COMPILING LATEX

First the template requires the `SourceCodePro` font.

To compile the generated LaTeX
```
xelatex <latex-file>
```

## TODO
- [x] consider using [json-next](https://github.com/json-next/json-next) for HanSON support (human readable json)
- [ ] md to tex for description fields
