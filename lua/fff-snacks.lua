---@module 'snacks'

---@module 'fff_snacks'

---@class snacks.picker.sources.Config
---@field fff snacks.picker.Config
---@field fff_live_grep fff_snacks.GrepConfig

---@class snacks.picker
---@field fff fun(opts?: snacks.picker.Config): snacks.Picker
---@field fff_live_grep fun(opts?: fff_snacks.GrepConfig): snacks.Picker

---@alias fff_snacks.GrepMode "plain" | "regex" | "fuzzy"

---@class fff_snacks.GrepConfig: snacks.picker.Config
---@field grep_mode? fff_snacks.GrepMode[]
---@field _is_grep_mode_plain? boolean
---@field _is_grep_mode_regex? boolean
---@field _is_grep_mode_fuzzy? boolean

---@class fff_snacks.GrepPicker: snacks.Picker
---@field opts fff_snacks.GrepConfig

return {
  sources = {
    find_files = require("fff-snacks.find_files").source,
    live_grep = require("fff-snacks.live_grep").source,
  },
  ---@param opts? snacks.picker.Config
  find_files = function(opts)
    Snacks.picker.fff(opts)
  end,
  ---@param opts? fff_snacks.GrepConfig
  live_grep = function(opts)
    Snacks.picker.fff_live_grep(opts)
  end,
  ---@param opts? fff_snacks.GrepConfig
  grep_word = function(opts)
    Snacks.picker.fff_live_grep(vim.tbl_deep_extend("force", opts or {}, {
      search = function(picker)
        return picker:word()
      end,
    }))
  end,
}
