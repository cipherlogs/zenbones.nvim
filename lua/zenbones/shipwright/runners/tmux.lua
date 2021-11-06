local template = [[set -g status-left ' #[fg=$magenta,bold]#{s/root//:client_key_table} '
set -g status-right '#[fg=$magenta,bold] [#S]#[fg=$magenta,bold] [%d/%m] #[fg=$magenta,bold][%I:%M%p] '
set -g status-style fg='$magenta',bg='$white'

set -g window-status-current-style fg='$magenta',bg='$white',bold

set -g pane-border-style fg='$magenta'
set -g pane-active-border-style fg='$magenta'

set -g message-style fg='$black',bg='$selection_bg'

set -g display-panes-active-colour '$magenta'
set -g display-panes-colour '$magenta'

set -g clock-mode-colour '$magenta'

set -g mode-style fg='$black',bg='$selection_bg'
]]

local helpers = require "shipwright.transform.helpers"

run(
	{ specs, p, term },
	transform.colorscheme_to_term_colors,
	function(colors)
		local text = helpers.apply_template(template, colors)
		return { text }
	end,
	{ prepend, "# This file is auto-generated by shipwright.nvim" },
	{ overwrite, string.format("extras/tmux/%s.tmux", name) }
)
