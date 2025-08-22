local M = {}

function M.delete_current_file()
  local buf  = vim.api.nvim_get_current_buf()
  local path = vim.api.nvim_buf_get_name(buf)
  if path == "" then
    vim.notify("No file associated with this buffer.", vim.log.levels.WARN)
    return
  end

  vim.ui.select({ "Delete", "Cancel" }, { prompt = "Delete file?" }, function(choice)
    if choice ~= "Delete" then return end
    if vim.fn.delete(path) ~= 0 then
      vim.notify("Delete failed: " .. path, vim.log.levels.ERROR)
      return
    end
    vim.cmd("enew")                              -- go to a fresh empty buffer
    pcall(vim.api.nvim_buf_delete, buf, { force = true }) -- wipe old buf
    vim.notify("Deleted: " .. path)
  end)
end

return M

