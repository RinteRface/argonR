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