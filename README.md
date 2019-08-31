### i3-scripts

I use the following scripts to handle window switching. \
Although in principle you can use them to apply any valid i3 command to a selected window.

The scripts expect to found in the PATH
(you may need to set it via: ~/.xsessionrc for i3 to see it)

```bash
i3-get-window-id.sh
i3-window-apply.sh
i3-window-switcher.sh
i3-workspace-window-list.sh
```

##### e.g., in your i3 config
```
  bindsym $mod+grave exec --no-startup-id i3-window-switcher.sh
  bindsym $mod+F4    exec --no-startup-id i3-window-apply.sh kill
```
