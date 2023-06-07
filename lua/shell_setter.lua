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

if vim.fn.executable('nu') == 1 then
  nu_shell()
else
  powershell()
end
