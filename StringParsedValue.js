// Input:  ...<body><h1 style="text-align: left;">Hello!</h1>...
// Usage:  input.parsedValue('<h1','>','</')
// Output: Hello!

String.prototype.parsedValue = function() {
  arguments = Array.from(arguments)
  arguments.filter(function(elm){ return elm instanceof String; })
  if (arguments.length < 2) return undefined
  var last = arguments.pop()
  var start = 0
  for (var i = 0; i < arguments.length; i++) {
    start = this.indexOf(arguments[i], start >= 0 ? start:0)
    if (start == -1) return undefined
    else start++
  }
  var end = this.length-1
  if (last) end = this.indexOf(last,start)
  return this.substring(start,end)
}
