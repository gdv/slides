# slides
My presentations with revealjs

## Presentations

- [Dummy Presentation](index.html) - A simple one-slide presentation

## Setup

Before viewing the presentations, you need to download reveal.js:

```bash
curl -L https://github.com/hakimel/reveal.js/archive/refs/tags/4.5.0.tar.gz -o reveal.tar.gz
tar -xzf reveal.tar.gz
mv reveal.js-4.5.0 reveal.js
rm reveal.tar.gz
```

## How to View

Open any of the HTML files in a web browser. For best results:

1. Clone this repository
2. Download reveal.js (see Setup section above)
3. Open the HTML file directly in your browser, or
4. Serve via a local web server:
   ```bash
   python -m http.server 8000
   ```
   Then navigate to `http://localhost:8000/index.html`
