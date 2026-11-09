set -l fzf_theme_opts "\
--color=bg+:#0a0d48
--color=bg:#070a36
--color=spinner:#f2f2f3
--color=hl:#fd4663
--color=fg:#f2f2f3
--color=header:#fd4663
--color=info:#6269ea
--color=pointer:#f2f2f3
--color=marker:#afafb6
--color=fg+:#f2f2f3
--color=prompt:#6269ea
--color=hl+:#fd4663
--color=selected-bg:#0a0d48
--color=border:#0a0d48
--color=label:#f2f2f3"

if set -q FZF_DEFAULT_OPTS[1]; and test -n "$FZF_DEFAULT_OPTS"
    set -Ux FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS
$fzf_theme_opts"
else
    set -Ux FZF_DEFAULT_OPTS "$fzf_theme_opts"
end
