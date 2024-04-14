local nu_shell = function ()
  vim.cmd([[let &shell = 'nu']])
  vim.cmd([[let &shellcmdflag = '-c']])
  vim.cmd([[let &shellquote = '']])
  vim.cmd([[let &shellxquote = '']])
end

local powershell = function()
  vim.cmd([[set shell=powershell]])
  vim.cmd([[set shellcmdflag=-command]])
  vim.cmd([[set shellquote=\"]])
  vim.cmd([[set shellxquote=]])
end

local TRUE = 1

if vim.fn.has("linux") == TRUE then
  return
end

if vim.fn.executable('nu') == TRUE then
  nu_shell()
else
  powershell()
end
