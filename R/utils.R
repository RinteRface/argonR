# Walk a tree of tag objects, rewriting objects according to func.
# preorder=TRUE means preorder tree traversal, that is, an object
# should be rewritten before its children.
rewriteTags <- function(ui, func, preorder) {
  if (preorder)
    ui <- func(ui)
  
  if (isTag(ui)) {
    ui$children[] <- lapply(ui$children, rewriteTags, func, preorder)
  } else if (isTagList(ui)) {
    ui[] <- lapply(ui, rewriteTags, func, preorder)
  }
  
  if (!preorder)
    ui <- func(ui)
  
  return(ui)
}


isTag <- function(x) {
  inherits(x, "shiny.tag")
}

isTagList <- function(x) {
  is.list(x) && (inherits(x, "shiny.tag.list") || identical(class(x), "list"))
}


# Given a tag object, extract out any children of tags$head
# and return them separate from the body.
takeHeads <- function(ui) {
  headItems <- list()
  result <- rewriteTags(ui, function(uiObj) {
    if (isTag(uiObj) && tolower(uiObj$name) == "head") {
      headItems <<- append(headItems, uiObj$children)
      return(NULL)
    }
    return(uiObj)
  }, FALSE)
  
  return(list(ui=result, head=headItems))
}

known_tags <- c(
  "a",
  "abbr",
  "address",
  "area",
  "article",
  "aside",
  "audio",
  "b",
  "base",
  "bdi",
  "bdo",
  "blockquote",
  "body",
  "br",
  "button",
  "canvas",
  "caption",
  "cite",
  "code",
  "col",
  "colgroup",
  "command",
  "data",
  "datalist",
  "dd",
  "del",
  "details",
  "dfn",
  "dialog",
  "div",
  "dl",
  "dt",
  "em",
  "embed",
  "eventsource",
  "fieldset",
  "figcaption",
  "figure",
  "footer",
  "form",
  "h1",
  "h2",
  "h3",
  "h4",
  "h5",
  "h6",
  "head",
  "header",
  "hgroup",
  "hr",
  "html",
  "i",
  "iframe",
  "img",
  "input",
  "ins",
  "kbd",
  "keygen",
  "label",
  "legend",
  "li",
  "link",
  "main",
  "mark",
  "map",
  "menu",
  "meta",
  "meter",
  "nav",
  "noscript",
  "object",
  "ol",
  "optgroup",
  "option",
  "output",
  "p",
  "param",
  "picture",
  "pre",
  "progress",
  "q",
  "rp",
  "rt",
  "ruby",
  "s",
  "samp",
  "script",
  "section",
  "select",
  "small",
  "source",
  "span",
  "strong",
  "style",
  "sub",
  "summary",
  "sup",
  "table",
  "tbody",
  "td",
  "template",
  "textarea",
  "tfoot",
  "th",
  "thead",
  "time",
  "title",
  "tr",
  "track",
  "u",
  "ul",
  "var",
  "video",
  "wbr"
)
names(known_tags) <- known_tags

tags <- lapply(known_tags, function(tagname) {
  function(...) {
    contents <- list(...)
    tag(tagname, contents)
  }
})


#' Namespaced IDs for inputs/outputs
#'
#' @param namespace The character vector to use for the namespace. 
#' This can have any length, though a single element is most common. 
#' Length 0 will cause the id to be returned without a namespace, and 
#' length 2 will be interpreted as multiple namespaces, in increasing 
#' order of specificity (i.e. starting with the top-level namespace).
#' @param id The id string to be namespaced (optional).
NS <- function (namespace, id = NULL) {
  if (length(namespace) == 0) 
    ns_prefix <- character(0)
  else ns_prefix <- paste(namespace, collapse = ns.sep)
  f <- function(id) {
    if (length(id) == 0) 
      return(ns_prefix)
    if (length(ns_prefix) == 0) 
      return(id)
    paste(ns_prefix, id, sep = ns.sep)
  }
  if (missing(id)) {
    f
  }
  else {
    f(id)
  }
}

#' @rdname NS
#' @export
ns.sep <- "-"