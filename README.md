# dotfiles

This is managed using [chezmoi](chezmoi.io) -- you can install it and these
dotfiles using

```
$ sh -c "$(curl -fsLS https://chezmoi.io/get)" -- init --apply skeate/chezmoi
```

Machine-specific configuration can be managed by editing
`$XDG_CONFIG_HOME/chezmoi/chezmoi.toml`, e.g.:

```
[data]
    machine = "work"
```

then, in a template file, `{{ if eq .machine "work" }}`. You can also use
built-in data (see output of `chezmoi data`) if you prefer to just use the
hostname, for example.
