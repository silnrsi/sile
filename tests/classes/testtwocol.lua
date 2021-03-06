local plain = SILE.require("classes/plain");
local testtwocols = plain { id = "testtwocols" };

local gutterWidth = "3%"
testtwocols:declareFrame("contentA", {left = "left(content)", right = "left(gutter)", top = "5%", bottom = "83.3%", next = "contentB", balanced = true })
testtwocols:declareFrame("contentB", {left = "right(gutter)", width="width(contentA) * 2 / 3", right = "right(content)", top = "5%", bottom = "top(footnotes)", balanced = true })
testtwocols:declareFrame("gutter", {left = "right(contentA)", right = "left(contentB)", width = gutterWidth })
testtwocols:declareFrame("footnotes", { left="left(contentB)", right = "right(contentB)", height = "0", bottom="83.3%"})

testtwocols.pageTemplate.firstContentFrame = testtwocols.pageTemplate.frames["contentA"];

testtwocols.init = function(self)
  testtwocols:loadPackage("footnotes", { insertInto = "footnotes", stealFrom = { contentB = 1 } } )
  return plain.init(self)
end

return testtwocols