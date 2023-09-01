DUB docs
========

Documentation for [dub](https://github.com/dlang/dub/) packages, see <https://dub.pm>.

For the package registry, see https://code.dlang.org

## Contributing

The documentation should be written using clear english, preferably avoiding addressing the reader with `"you"`, but rather using the passive form.

The "dub-guide" folder (called DUB Guide) should contain quick summaries for the experienced user to quickly look up features, but also for the casual user to understand how most things work. Explanation should be kept short and concise. Whenever there are things that might not be completely clear, example images, CLI output or full project file structures should be provided.

The "dub-reference" folder (called DUB Reference) should contain everything there is to know about DUB for the user. Everything should try to contain example recipes, example code, example output, so users know what to expect using things.

Try not to duplicate information from the guide and the reference, but rather give short summaries in the guide and link to the reference for more in-depth explanation.

The CLI reference is auto-generated and can be improved by improving the man page generator in the DUB project. (currently the markdown output is not yet PRd / merged into master there, so try to wait a little bit for this first)

The intro pages should show everything to get started and not much more, to not overwhelm the user.

### Local development

To work on docs locally:

```
# you might want to create a virtualenv if you work with python or other mkdocs sites a lot
python3 -m pip install -r requirements.txt
mkdocs serve
```

and to build static pages to distribute:

```
mkdocs build
```
