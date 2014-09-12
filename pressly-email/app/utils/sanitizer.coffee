sanitizer = new Sanitize(
  elements: ['a','p','b','u','i','em','h1','h2','h3','h4','h5','h6','blockquote','table','tr','td','img','small','span','div']
  attributes:
    a: ['href','title','style']
    table: ['style','width','height','cellspacing','cellpadding','align','valign','bgcolor','color']
    tr: ['style','width','height','cellspacing','cellpadding','align','valign','bgcolor','color']
    td: ['style','width','height','colspan','cellspacing','cellpadding','align','valign','bgcolor','color']
    h1: ['style','width','height']
    span: ['style','width','height']
    div: ['style','width','height']
    h2: ['style','width','height']
    p: ['style','width','height']
    img: ['src','width','height','style']
    small: ['style']
)

`export default sanitizer`
