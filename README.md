# feline.nvim

A minimal, stylish and customizable statusline for Neovim written in Lua

Requires Neovim >= 0.5

## About

Feline is a lua statusline inspired by [galaxyline](https://github.com/glepnir/galaxyline.nvim), but being more minimal and keeping complete customizability in mind. Feline is less of a statusline unto itself but more of a framework for you to easily build your own statusline on, while being able to tweak every tiny bit to your heart's content. But for those who just want to get stuff done, Feline also provides a default statusline which should fit the needs of most people.

## Features

- Ease-of-use.
- Completely customizability over every component.
- Built-in providers for things like vi-mode, file info, file size, cursor position, diagnostics (using [Neovim's buiilt-in LSP](https://neovim.io/doc/user/lsp.html)), git branch and diffs (using [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim/)), etc.
- Minimalistic, only provides the bare minimum and allows the user to build their own components very easily.

## Requirements

- Necessary
  - Neovim >= 0.5
  - Truecolor support for Neovim (with `set termguicolors` and a truecolor supporting Terminal / GUI)
- Optional
  - [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons/) - For icon support
  - [A patched font](https://github.com/ryanoasis/nerd-fonts/) - For icon support
  - [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim/) - For git info
  - [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig/) - To configure LSP for diagnostics

## Screenshots

**Default setup:**
![image](https://user-images.githubusercontent.com/29580810/114544000-d3028400-9c7b-11eb-856c-2feb166334b2.png)

**Default no-icons setup:**
![image](https://user-images.githubusercontent.com/29580810/114742106-36201380-9d6d-11eb-9866-e8c0fef8a1bd.png)

**[Config by crivotz:](https://github.com/crivotz/nv-ide/blob/master/lua/plugins/feline.lua)**
![image](https://user-images.githubusercontent.com/3275600/114841377-0ce89d00-9dd8-11eb-82b4-b3ee332771c2.png)

**[Config by 6cdh:](https://github.com/6cdh/dotfiles/blob/main/nvim/.config/nvim/lua/statusline.lua)**
![image](https://user-images.githubusercontent.com/39000776/114838041-e68e2600-9e06-11eb-9334-431a627ff144.png)

**[Config by luizcoro2:](https://bitbucket.org/luizcoro/dotfiles/src/master/.config/nvim/lua/plugins/feline.lua)**
![image](https://user-images.githubusercontent.com/70335871/115327167-dd81b980-a164-11eb-9c02-7a3a1b6a94b5.png)

**[Config by rafamadriz (classic):](https://github.com/rafamadriz/dotfiles/blob/main/.config/nvim/lua/plugins/statusline/styles/classic.lua)**

**Gruvbox:**
![image](https://user-images.githubusercontent.com/67771985/116002735-a7bc5500-a5ea-11eb-82e3-86d1837902cf.png)
**Nord:**
![image](https://user-images.githubusercontent.com/67771985/116002779-d3d7d600-a5ea-11eb-8772-7cb85d7bc324.png)

**[Config by rafamadriz (slant):](https://github.com/rafamadriz/dotfiles/blob/main/.config/nvim/lua/plugins/statusline/styles/slant.lua)**

**Gruvbox:**
![image](https://user-images.githubusercontent.com/67771985/116002799-e94d0000-a5ea-11eb-9472-da0d75bbcceb.png)
**Nord:**
![image](https://user-images.githubusercontent.com/67771985/116002808-efdb7780-a5ea-11eb-97eb-caf7875e9a3d.png)

**[Config by rafamadriz (VSCode):](https://github.com/rafamadriz/dotfiles/blob/main/.config/nvim/lua/plugins/statusline/styles/vscode.lua)**
![image](https://user-images.githubusercontent.com/67771985/117713773-9d42b380-b1c5-11eb-8a8b-76949c9b2db1.png)

**[Config by pianocomposer321:](https://gist.github.com/pianocomposer321/6151c458132a97590d21415db67361a6)**
![image](https://user-images.githubusercontent.com/54072354/117869424-65d51500-b260-11eb-898c-0a0b987a6275.png)

**NOTE: You can add your own configuration to this list. If you're interested, simply make a pull request and I'll add it.**

## How to install

- [packer.nvim](https://github.com/wbthomason/packer.nvim/):

```
use 'famiu/feline.nvim'
```

- [paq-nvim](https://github.com/savq/paq-nvim/)

```
paq 'famiu/feline.nvim'
```

- [vim-plug](https://github.com/junegunn/vim-plug/):

```
Plug 'famiu/feline.nvim'
```

- Using Neovim's built-in plugin manager (Linux or MacOS):<br><br>Open your Terminal and enter the following command:

```bash
git clone https://github.com/famiu/feline.nvim/ ~/.local/share/nvim/site/pack/feline.nvim/start/feline.nvim/
```

- Using Neovim's built-in plugin manager (Windows):<br><br>Open Powershell and enter the following command:

```powershell
git clone https://github.com/famiu/feline.nvim/ ~\AppData\Local\nvim-data\site\pack\feline.nvim\start\feline.nvim\
```

## How to use

Once you've installed Feline, it's very easy to start using it. Here are the following options for using Feline:

### 1. Using default statusline.

If you want an opinionated statusline that "just works", then you can just use Feline's default statusline, for which you just have to add the `setup()` function to your config:

```lua
require('feline').setup()
```

In case you don't have nvim-web-devicons or a patched font, or just don't like icons, there's also a default statusline configuration without icons. To use it, just do:

```lua
require('feline').setup({
    preset = 'noicon'
})
```

You can also make minor tweaks like changing the default foreground and background color like this:

```lua
require('feline').setup({
    default_fg = '#D0D0D0',
    default_bg = '#1F1F23'
})
```

### 2. Building your own statusline.

If you don't mind getting your hands dirty, then I recommend making your own statusline, it's very easy to do so, but for that you have to first understand how Feline works.<br><br>Feline has a statusline generator that takes a `components` value and a `properties` value, both of them are Lua tables. The `components` table needs to contain the statusline components while the `properties` table needs to contain the statusline properties.

#### Components

Inside the `components` table, there needs to be three more tables, `left`, `mid` and `right`, which will dictate if the component should be put in the left side, middle or the right side of the statusline. And in each of those tables, there needs to be two more tables, `active` and `inactive`, which will dictate whether the component is a part of the statusline when it's in the active window or the inactive window.

So first, in your init.lua file, you have to initialize the components table

```lua
-- Initialize the components table
local components = {
    left = {active = {}, inactive = {}},
    mid = {active = {}, inactive = {}},
    right = {active = {}, inactive = {}}
}
```

You can then add new components to the statusline by adding an element to the `active` or `inactive` table inside any of those three tables. For example:

```lua
-- Insert a component that will be on the left side of the statusline
-- when the window is active:
table.insert(components.left.active, {
    -- Component info here
})

-- Insert a component that will be on the middle of the statusline
-- when the window is active:
table.insert(components.mid.active, {
    -- Component info here
})

-- Insert a component that will be on the right side of the statusline
-- when the window is active:
table.insert(components.right.active, {
    -- Component info here
})

-- Insert a component that will be on the left side of the statusline
-- when the window is inactive:
table.insert(components.left.inactive, {
    -- Component info here
})

--- Insert a component that will be on the middle of the statusline
-- when the window is inactive:
table.insert(components.mid.inactive, {
    -- Component info here
})

- Insert a component that will be on the right side of the statusline
-- when the window is inactive:
table.insert(components.right.inactive, {
    -- Component info here
})
```

Alternatively you can also use Lua table indexes instead of table.insert, like:

```lua
-- Insert a component that will be on the right side of the statusline
-- when the window is active:
components.right.active[1] = {
    -- Component info here
}

-- Insert another component that will be on the right side of the statusline
-- when the window is active:
components.right.active[2] = {
    -- Component info here
}
```

**NOTE:** If you use the index instead of table.insert, remember to put the correct index. Also remember that unlike most other programming languages, Lua indices start at `1` instead of `0`.

Now you can customize each component to your liking. Most values that a component requires can also use a function without arguments, with the exception of the `provider` value, which can take one argument, more about that below. Feline will automatically evaluate the function if it is given a function. But in case a function is provided, the type of value the function returns must be the same as the type of value required by the component. For example, since `enabled` requires a boolean value, if you set it to a function, the function must also return a boolean value. Note that you can omit all of the component values except `provider`, in which case the defaults would be used instead. A component can have the following values:

- `provider` (string): Text to show. If it's a function, it must evaluate to a string. The function can take either no arguments, or one argument which would contain the component itself

```lua
-- Provider that shows current line in file
provider = function()
    return string.format('%d:%d', vim.fn.line('.'), vim.fn.col('.'))
end

-- Providers can also take the component as an argument
provider = function(component)
    if component.icon then
        return component.icon
    else
        return ''
    end
end

-- Providers can also just contain a simple string, such as:
provider = 'some text here'
```

There are also some [default providers](#default-providers), to use them, you just use the provider name like this:

```lua
provider = 'position' -- This will use the default file position provider.
```

Note that you can also use your [manually added providers](#adding-your-own-provider) the same way

- `enabled` (boolean): Determines if the component is enabled. If false, the component is not shown in the statusline. For example:

```lua
-- Enable if opened file has a valid size
enabled = function()
    return vim.fn.getfsize(vim.fn.expand('%:p')) > 0
end
```

- `icon` (string): Some components use a glyph icon. If you either don't have a patched font or don't like the default icon that Feline provides, you may set this value to use any icon you want instead. For example:

```lua
-- Setting icon to a string
icon = ' + '

-- Setting icon to a function
icon = function() return ' - ' end
```

- `hl` (table): Determines the highlight settings. The hl table can have three values:
  - `hl.fg` (string): RGB hex or [name](#value-presets) of foreground color. (eg: `'#FFFFFF'`, `'white'`).<br>By default it uses the default foreground color provided in the `setup()` function.
  - `hl.bg` (string): RGB hex or [name](#value-presets) of background color. (eg: `#000000'`, `'black'`).<br>By default it uses the default background color provided in the `setup()` function.
  - `hl.style` (string): Formatting style of text. (eg: `'bold,undercurl'`).<br>By default it is set to `'NONE'`
  - `hl.name` (string): Name of highlight group created by Feline (eg: `'VimInsert'`).<br><br>Note that `StatusComponent` is prepended to the name you provide. So if you provide the name `VimInsert`, the highlight group created will have the name `StatusComponentVimInsert`.<br><br>If a name is not provided, Feline automatically generates a unique name for the highlight group based on the other values.

An example of using the hl group:

```lua
-- As a table
hl = {
    fg = 'skyblue'
}

-- As a function
hl = function()
    local val = {}

    val.name = require('feline.providers.vi_mode').get_mode_highlight_name()
    val.fg = require('feline.providers.vi_mode').get_mode_color()
    val.style = 'bold'

    return val
end
```

<br>

**NOTE:** Some providers may also have special component values unique to them, such as the `file_info` provider having a `file_modified_icon` value that you can set. For more info, see: [default providers](#default-providers).
<br><br>

##### Separators

Separators are both the simplest and the trickiest part of Feline. There are two types of separator values that you can put in a component, which are `left_sep` and `right_sep`, which represent the separator on the left and the right side of the component, respectively.

The value of `left_sep` and `right_sep` can just be set to a string that's displayed. You can use a function that returns a string just like the other component values. The value can also be equal to the name of one of the [separator presets](#value-presets). The value of `left_sep` and `right_sep` can also be a table or a function returning a table. Inside the table there would be two values, `str` and `hl`, where `str` would represent the separator string and `hl` would represent the separator highlight. The separator's highlight works just like the component's `hl` value. The only difference is that the separator's `hl` by default uses the parent's background color as its foreground color.

But you can also set `left_sep` and `right_sep` to be a `table` containing multiple separator elements, you can use this if you want to have different highlights for different parts of the left/right separator of the same component or if you want to better organize your separator components.

For example:

```lua
-- Setting sep to a string
left_sep = ' '

-- Setting sep to a separator preset
left_sep = 'slant_right'

-- Setting sep to a table with highlight
left_sep = {
    str = 'slant_left',
    hl = {
        fg = 'oceanblue',
        bg = 'bg'
    }
}

-- Setting sep to a function
right_sep = function()
    local val = {hl = {fg = 'NONE', bg = 'black'}}
    if vim.b.gitsigns_status_dict then val.str = ' ' else val.str = '' end

    return val
end

-- Setting sep to a list separator elements
right_sep = {
    {
        str = ' ',
        hl = {
            fg = 'NONE',
            bg = 'oceanblue'
        }
    },
    -- The line below is equivalent to { str = 'slant_right' }
    'slant_right'
}
```

##### Component example

Now that we know of the possible values you can set in a component, let's make some actual components to show you how it all looks like together:

[**NOTE:** Remember to initialize the components table before assigning anything to it]

```lua
-- Component that shows Vi mode with highlight
components.left.active[1] = {
    provider = 'vi_mode',
    hl = function()
        local val = {}

        val.name = vi_mode_utils.get_mode_highlight_name()
        val.fg = vi_mode_utils.get_mode_color()
        val.style = 'bold'

        return val
    end,
    right_sep = ' '
}

-- Component that shows file info
components.left.active[2] = {
    provider = 'file_info',
    hl = {
        fg = 'white',
        bg = 'oceanblue',
        style = 'bold'
    },
    left_sep = {' ', 'slant_left_2'},
    right_sep = {'slant_right_2', ' '},
    -- Uncomment the next line to disable file icons
    -- icon = ''
}

-- Components that show current file size
components.left.active[3] = {
    provider = 'file_size',
    enabled = function() return vim.fn.getfsize(vim.fn.expand('%:p')) > 0 end,
    right_sep = {
        ' ',
        {
            str = 'slant_left_2_thin',
            hl = {
                fg = 'fg',
                bg = 'bg'
            }
        },
        ' '
    }
}

-- Component that shows file encoding
components.mid.active[1] = {
    provider = 'file_encoding'
}

-- Component that shows current git branch
components.right.active[1] = {
    provider = 'git_branch',
    hl = {
        fg = 'white',
        bg = 'black',
        style = 'bold'
    },
    right_sep = function()
        local val = {hl = {fg = 'NONE', bg = 'black'}}
        if vim.b.gitsigns_status_dict then val.str = ' ' else val.str = '' end

        return val
    end
}
```

##### Value presets

Value presets are names for colors and separators that you can use instead of the hex code or separator string, respectively.

For your ease of use, Feline has some default color and separator values set. You can manually access them through `require('feline.defaults').colors` and `require('feline.defaults').separators` respectively. But there's a much easier way to use them, which is to just directly assign the name of the color or separator to the value, eg:

```lua
hl = {bg = 'oceanblue'},
right_sep = 'slant_right'
```

Not only that, you can add your own custom colors and separators through [the setup function](#the-setup-function) which allows you to just use the name of the color or separator to refer to it.

Below is a list of all the default value names and their values:

###### Default colors

| Name        | Value       |
| ----------- | ----------- |
| `fg`        | `'#D0D0D0'` |
| `bg`        | `'#1F1F23'` |
| `black`     | `'#1B1B1B'` |
| `skyblue`   | `'#50B0F0'` |
| `cyan`      | `'#009090'` |
| `green`     | `'#60A040'` |
| `oceanblue` | `'#0066cc'` |
| `magenta`   | `'#C26BDB'` |
| `orange`    | `'#FF9000'` |
| `red`       | `'#D10000'` |
| `violet`    | `'#9E93E8'` |
| `white`     | `'#FFFFFF'` |
| `yellow`    | `'#E1E120'` |

###### Default Separators

| Name                 | Value |
| -------------------- | ----- |
| `vertical_bar`       | `'┃'` |
| `vertical_bar_thin`  | `'│'` |
| `left`               | `''` |
| `right`              | `''` |
| `block`              | `'█'` |
| `left_filled`        | `''` |
| `right_filled`       | `''` |
| `slant_left`         | `''` |
| `slant_left_thin`    | `''` |
| `slant_right`        | `''` |
| `slant_right_thin`   | `''` |
| `slant_left_2`       | `''` |
| `slant_left_2_thin`  | `''` |
| `slant_right_2`      | `''` |
| `slant_right_2_thin` | `''` |
| `left_rounded`       | `''` |
| `left_rounded_thin`  | `''` |
| `right_rounded`      | `''` |
| `right_rounded_thin` | `''` |
| `circle`             | `'●'` |

#### Properties

Besides components, the generator may also be given a `properties` table. The `properties` table only needs one element, which is the table `force_inactive`, it represents which buffer types, filetypes or buffer names will always have the inactive statusline, regardless of whether they're active or inactive. You may need that in order to prevent irrelevant or unneeded information from being shown on buffers like the file tree, terminal, etc.

Finally, `force_inactive` needs three elements in it, `filetypes`, `buftypes` and `bufnames`, all of which are tables containing the filetypes, buffer types and buffer names respectively that will be forced to have the inactive statusline. Here's an example of how to set the properties table

```lua
-- Initialize the properties table
properties = {
    force_inactive = {
        filetypes = {},
        buftypes = {},
        bufnames = {}
    }
}

properties.force_inactive.filetypes = {
    'NvimTree',
    'dbui',
    'packer',
    'startify',
    'fugitive',
    'fugitiveblame'
}

properties.force_inactive.buftypes = {
    'terminal'
}

properties.force_inactive.bufnames = {
    'some_buffer_name'
}
```

And that's it, that's how you set up the properties table

#### The setup function

Now that we've learned to set up both the components table and the properties table, it's finally time to revisit the setup function. The setup function takes a table that can have the following values:

- `preset` - Set it to use a preconfigured statusline. Currently it can be equal to either `default` for the default statusline or `noicon` for the default statusline without icons. You don't have to put any of the other values if you use a preset, but if you do, your settings will override the preset's settings. To see more info such as how to modify a preset to build a statusline, see: [Modifying an existing preset](#3.-modifying-an-existing-preset)
- `default_fg` - [Name](#value-presets) or RGB hex code of default foreground color.
- `default_bg` - [Name](#value-presets) or RGB hex code of default background color.
- `colors` - A table containing custom [color value presets](#value-presets).
- `separators` - A table containing custom [separator value presets](#value-presets).
- `components` - The components table.
- `properties` - The properties table.
<<<<<<< HEAD
- `vi_mode-colors` - A table containing colors associated with Vi modes. It can later be used to get the color associated with the current Vim mode using `require('feline.providers.vi_mode').get_mode_color()`. For more info on it see the [Vi-mode](#vi-mode) section.<br><br>Here is a list of all possible vi_mode names used with the default color associated with them:
=======
- `vi_mode_colors` - A table containing colors associated with Vi modes. It can later be used to get the color associated with the current Vim mode using `require('feline.providers.vi_mode').get_mode_color()`. For more info on it see the [Vi-mode](#vi-mode) section.<br><br>Here is a list of all possible vi_mode names used with the default color associated with them:
>>>>>>> upstream/master

| Mode        | Description           | Value       |
| ----------- | --------------------- | ----------- |
| `NORMAL`    | Normal mode           | `'green'`   |
| `OP`        | Operator pending mode | `'green'`   |
| `INSERT`    | Insert mode           | `'red'`     |
| `VISUAL`    | Visual mode           | `'skyblue'` |
| `BLOCK`     | Visual block mode     | `'skyblue'` |
| `REPLACE`   | Replace mode          | `'violet'`  |
| `V-REPLACE` | Virtual Replace mode  | `'violet'`  |
| `ENTER`     | Enter mode            | `'cyan'`    |
| `MORE`      | More mode             | `'cyan'`    |
| `SELECT`    | Select mode           | `'orange'`  |
| `COMMAND`   | Command mode          | `'green'`   |
| `SHELL`     | Shell mode            | `'green'`   |
| `TERM`      | Terminal mode         | `'green'`   |
| `NONE`      | None                  | `'yellow'`  |

#### Example config

It's finally time to see a fully-fledged example of how to set up the statusline. Here is an example config that's actually the same as the default config, except it's set-up manually:

```lua
local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')

local b = vim.b
local fn = vim.fn

local properties = {
    force_inactive = {
        filetypes = {},
        buftypes = {},
        bufnames = {}
    }
}

local components = {
    left = {
        active = {},
        inactive = {}
    },
    mid = {
        active = {},
        inactive = {}
    },
    right = {
        active = {},
        inactive = {}
    }
}

properties.force_inactive.filetypes = {
    'NvimTree',
    'dbui',
    'packer',
    'startify',
    'fugitive',
    'fugitiveblame'
}

properties.force_inactive.buftypes = {
    'terminal'
}

components.left.active[1] = {
    provider = '▊ ',
    hl = {
        fg = 'skyblue'
    }
}

components.left.active[2] = {
    provider = 'vi_mode',
    hl = function()
        local val = {}

        val.name = vi_mode_utils.get_mode_highlight_name()
        val.fg = vi_mode_utils.get_mode_color()
        val.style = 'bold'

        return val
    end,
    right_sep = ' '
}

components.left.active[3] = {
    provider = 'file_info',
    hl = {
        fg = 'white',
        bg = 'oceanblue',
        style = 'bold'
    },
    left_sep = {
        ' ', 'slant_left_2',
        {str = ' ', hl = {bg = 'oceanblue', fg = 'NONE'}}
    },
    right_sep = {'slant_right_2', ' '}
}

components.left.active[4] = {
    provider = 'file_size',
    enabled = function() return fn.getfsize(fn.expand('%:p')) > 0 end,
    right_sep = {
        ' ',
        {
            str = 'slant_left_2_thin',
            hl = {
                fg = 'fg',
                bg = 'bg'
            }
        },
        ' '
    }
}

components.left.active[5] = {
    provider = 'position',
    right_sep = {
        ' ',
        {
            str = 'slant_right_2_thin',
            hl = {
                fg = 'fg',
                bg = 'bg'
            }
        }
    }
}

components.left.active[6] = {
    provider = 'diagnostic_errors',
    enabled = function() return lsp.diagnostics_exist('Error') end,
    hl = { fg = 'red' }
}

components.left.active[7] = {
    provider = 'diagnostic_warnings',
    enabled = function() return lsp.diagnostics_exist('Warning') end,
    hl = { fg = 'yellow' }
}

components.left.active[8] = {
    provider = 'diagnostic_hints',
    enabled = function() return lsp.diagnostics_exist('Hint') end,
    hl = { fg = 'cyan' }
}

components.left.active[9] = {
    provider = 'diagnostic_info',
    enabled = function() return lsp.diagnostics_exist('Information') end,
    hl = { fg = 'skyblue' }
}

components.right.active[1] = {
    provider = 'git_branch',
    hl = {
        fg = 'white',
        bg = 'black',
        style = 'bold'
    },
    right_sep = function()
        local val = {hl = {fg = 'NONE', bg = 'black'}}
        if b.gitsigns_status_dict then val.str = ' ' else val.str = '' end

        return val
    end
}

components.right.active[2] = {
    provider = 'git_diff_added',
    hl = {
        fg = 'green',
        bg = 'black'
    }
}

components.right.active[3] = {
    provider = 'git_diff_changed',
    hl = {
        fg = 'orange',
        bg = 'black'
    }
}

components.right.active[4] = {
    provider = 'git_diff_removed',
    hl = {
        fg = 'red',
        bg = 'black'
    },
    right_sep = function()
        local val = {hl = {fg = 'NONE', bg = 'black'}}
        if b.gitsigns_status_dict then val.str = ' ' else val.str = '' end

        return val
    end
}

components.right.active[5] = {
    provider = 'line_percentage',
    hl = {
        style = 'bold'
    },
    left_sep = '  ',
    right_sep = ' '
}

components.right.active[6] = {
    provider = 'scroll_bar',
    hl = {
        fg = 'skyblue',
        style = 'bold'
    }
}

components.left.inactive[1] = {
    provider = 'file_type',
    hl = {
        fg = 'white',
        bg = 'oceanblue',
        style = 'bold'
    },
    left_sep = {
        str = ' ',
        hl = {
            fg = 'NONE',
            bg = 'oceanblue'
        }
    },
    right_sep = {
        {
            str = ' ',
            hl = {
                fg = 'NONE',
                bg = 'oceanblue'
            }
        },
        'slant_right'
    }
}

-- This table is equal to the default colors table
local colors = {
    black = '#1B1B1B',
    skyblue = '#50B0F0',
    cyan = '#009090',
    green = '#60A040',
    oceanblue = '#0066cc',
    magenta = '#C26BDB',
    orange = '#FF9000',
    red = '#D10000',
    violet = '#9E93E8',
    white = '#FFFFFF',
    yellow = '#E1E120'
}

-- This table is equal to the default separators table
local separators = {
    vertical_bar = '┃',
    vertical_bar_thin = '│',
    left = '',
    right = '',
    block = '█',
    left_filled = '',
    right_filled = '',
    slant_left = '',
    slant_left_thin = '',
    slant_right = '',
    slant_right_thin = '',
    slant_left_2 = '',
    slant_left_2_thin = '',
    slant_right_2 = '',
    slant_right_2_thin = '',
    left_rounded = '',
    left_rounded_thin = '',
    right_rounded = '',
    right_rounded_thin = '',
    circle = '●'
}

-- This table is equal to the default vi_mode_colors table
local vi_mode_colors = {
    NORMAL = 'green',
    OP = 'green',
    INSERT = 'red',
    VISUAL = 'skyblue',
    BLOCK = 'skyblue',
    REPLACE = 'violet',
    ['V-REPLACE'] = 'violet',
    ENTER = 'cyan',
    MORE = 'cyan',
    SELECT = 'orange',
    COMMAND = 'green',
    SHELL = 'green',
    TERM = 'green',
    NONE = 'yellow'
}

require('feline').setup({
    default_bg = '#1F1F23',
    default_fg = '#D0D0D0',
    colors = colors,
    separators = separators,
    components = components,
    properties = properties,
    vi_mode_colors = vi_mode_colors
})
```

### 3. Modifying an existing preset

If you like the defaults for the most part but there's some things you want to change, then you'd be glad to know that it's easy to just modify an existing preset to get the statusline configuration you want. Just do:

```lua
-- Substitute preset_name with the name of the preset you want to modify.
-- eg: "default" or "noicon"
local components = require('feline.presets')[preset_name].components
local properties = require('feline.presets')[preset_name].properties
```

After that, you can just modify those values and call [the setup function](#the-setup-function) with the preset as you normally would.

## Providers

### Default providers

Feline by default has some built-in providers to make your life easy. They are:
|Name|Description|
--|--
|[`vi_mode`](#vi-mode)|Current vi_mode|
|`position`|Get line and column number of cursor|
|`line_percentage`|Current line percentage|
|`scroll_bar`|Scroll bar that shows file progress|
|[`file_info`](#file-info)|Get file icon, name and modified status|
|`file_size`|Get file size|
|`file_type`|Get file type|
|`file_encoding`|Get file encoding|
|`git_branch`|Shows current git branch|
|`git_diff_added`|Git diff added count|
|`git_diff_removed`|Git diff removed count|
|`git_diff_changed`|Git diff changed count|
|`lsp_client_names`|Name of LSP clients attached to current buffer|
|`diagnostic_errors`|Diagnostics errors count|
|`diagnostic_warnings`|Diagnostics warnings count|
|`diagnostic_hints`|Diagnostics hints count|
|`diagnostic_info`|Diagnostics info count|

#### Vi-mode

The vi-mode provider by itself only shows an icon. To actually indicate the current Vim mode, you have to use `require('feline.providers.vi_mode').get_mode_color()` as shown in the [example config](#example-config).

Note that this is different if you set the `icon` value of the component to `''`, in that case it'll use the name of the mode instead of an icon, which is what the `noicon` preset uses.

Here is the simplest method to make a component with proper Vi-mode indication:

```lua
-- Remember to change "components.left.active[1]" according to the rest of your config
components.left.active[1] = {
    provider = 'vi_mode',
    hl = function()
        local val = {}

        val.name = require('feline.providers.vi_mode').get_mode_highlight_name()
        val.fg = require('feline.providers.vi_mode').get_mode_color()
        val.style = 'bold'

        return val
    end,
    right_sep = ' ',
    -- Uncomment the next line to disable icons for this component and use the mode name instead
    -- icon = ''
}
```

The Vi-mode provider also provides a helper function `get_mode_highlight_name()` which can be used through `require('feline.providers.vi_mode').get_mode_highlight_name()`, it returns the highlight name for the current mode, which you can then use for the provider's `hl.name` to give its highlight groups meaningful names, as shown in the [example config](#example-config)

#### File Info

The `file_info` provider has a special `file_modified_icon` component value that you can set to change the icon that is shown when a file is modified. By default it is set to `'●'`.

#### Git

The git providers all require [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim/), make sure you have it installed when you use those providers, otherwise they'll output nothing.

#### Diagnostics

The diagnostics and LSP providers all require the Neovim built-in LSP to be configured and at least one LSP client to be attached to the current buffer, else they'll have no output.

The diagnostics provider also provides a utility function `require('feline.providers.lsp').diagnostics_exist(type)` where type represents the type of diagnostic. The values of `type` must be one of `'Error'`, `'Warning'`, `'Hint'` or `'Information'`. You may use this function in the `enabled` value of a diagnostics component to disable the component if there are no diagnostics, as shown in the [example config](#example-config).

### Adding your own provider

In case none of the default providers do what you want, it's very easy to add your own provider. Just call `require('feline.providers').add_provider(name, function)` where `name` is the name of the provider and `function` is the function associated with the provider, you can then use your provider the same way you use the other providers. Remember, the function has to take either no argument, or one argument that contains the component and its values.

## Help

### Common issues

#### Feline crashes or disappears for seemingly no reason

This can be caused if you forget to remove your other statusline plugins after installing Feline. Make sure all other statusline plugins are removed before you install Feline, that should fix the issue.

### Tips and tricks

#### Reset highlight

If, for some reason, you want to clear all highlights that Feline sets (useful if you want to reload your entire Neovim config which may mess up highlights), you can do:

```lua
require('feline').reset_highlights()
```

And then Feline will automatically regenerate those highlights when it needs them, so you don't have to worry about setting the highlights yourself.

#### Disable inactive statusline

If you want, you can just disable the inactive statusline by doing:

```lua
-- Remove all inactive statusline components
components.left.inactive = {}
components.mid.inactive = {}
components.right.inactive = {}
```

Alternatively, you could also use a thin line instead of the inactive statusline to separate you windows, like the vertical split seperator, except in this case it would act as a horizontal separator of sorts. You can do this through:

```lua
local nvim_exec = vim.api.nvim_exec

-- Remove all inactive statusline components
components.left.inactive = {}
components.mid.inactive = {}
components.right.inactive = {}

-- Get highlight of inactive statusline by parsing the style, fg and bg of VertSplit
local InactiveStatusHL = {
    fg = nvim_exec("highlight VertSplit", true):match("guifg=(#%d+)") or '#444444',
    bg = nvim_exec("highlight VertSplit", true):match("guibg=(#%d+)") or '#1E1E1E',
    style = nvim_exec("highlight VertSplit", true):match("gui=(#%d+)") or ''
}

-- Add strikethrough to inactive statusline highlight style
-- in order to have a thin line instead of the statusline
if InactiveStatusHL.style == '' then
    InactiveStatusHL.style = 'strikethrough'
else
    InactiveStatusHL.style = InactiveStatusHL.style .. ',strikethrough'
end

-- Apply the highlight to the statusline
-- by having an empty provider with the highlight
components.left.inactive[1] = {
    provider = '',
    hl = InactiveStatusHL
}

-- Setup feline.nvim
require('feline').setup()
```

### Reporting issues or feature requests

If you have an issue that you can't find the fix to in the documentation or want to request a feature you think is absolutely necessary, feel free to make a new [issue](https://github.com/famiu/feline.nvim/issues) and I will try my best to look into it.

## Why Feline?

Now, you might be thinking, why do we need another statusline plugin? We've already got a bunch of brilliant statusline plugins like galaxyline, airline, lualine, expressline etc. and all of them are excellent. So then, why Feline? What I'm about to say can be (and probably is) very biased and opinionated but, despite those plugins being neat, I think each have their own shortcomings, which I see as too much to ignore. Also I could be wrong about some of these things since I haven't used some of the plugins I'm about to mention.

Firstly, Feline is built for customizability from the ground up. You are not limited in any way by what the plugin provides. You can control every individual component and its location, appearance, everything about it. I find that all other plugins are very limited when it comes to customizability.

For example, Airline allows some customization through Vim's statusline syntax, which I find to be quite ugly and complicated. Lualine seems to give you little control over component separators, whereas Feline gives you complete control over what separator to use on what component, including the highlight of each separator. Feline also allows you to conditionally enable or disable components at any time, giving you complete control over your statusline.

Galaxyline is also a great plugin, I'd say it's much more customizable than the others I've mentioned. I used galaxyline before I created Feline and galaxyline is what inspired this plugin. But I think even galaxyline has its flaws. First and foremost, while I used galaxyline, I've found that it doesn't allow using the short statusline on components based on their buffer type or buffername, which meant I couldn't use the short line list on my terminal buffers. It also only allowed separator on one side of each component, making you resort to the separator of the previous or next component if you wanted separator on both sides, which caused all sorts of visual issues like the separator from the previous or next component being there even if the component you wanted the separator for is disabled.

Lastly, Feline only implements the bare minimum required for you to get started, and both expects and invites the user to make their own components and providers, because nobody understands you better than yourself. So my real intention is to make creating your own statusline as easy for you as possible, while also providing reasonable defaults that should be enough for most people.

And this plugin is named after cats, you won't get that anywhere else.

So yeah, those are the reasons to use Feline: minimalism, complete customizability, reasonable defaults, and cats.

## LICENSE

Feline is licensed under GNU GPLv3. For more info, see: [LICENSE.md](LICENSE.md).

## Miscellaneous

### Naming

The name of this plugin is a silly pun based on the convention of the names of statusline plugins ending with 'line', while also being named after cats. And in a way this statusline is supposed to be as quick as a cat's instincts, so I guess the name fits.

### Special thanks

[glepnir](https://github.com/glepnir) - for creating [galaxyline](https://github.com/glepnir/galaxyline.nvim) which this plugin was inspired by.

## Self-plug

If you liked this plugin, also check out:

- [nvim-reload](https://github.com/famiu/nvim-reload) - Plugin to easily reload your Neovim config.
