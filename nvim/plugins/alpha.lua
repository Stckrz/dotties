return {
	'goodlord/alpha-nvim',
	event = 'VimEnter',
	opts = function()
		local dashboard = require('alpha.themes.dashboard')
         dashboard.section.header.val = {
             [[                                               ]],
             [[  _               /_\         ]],
             [[ /  \  / __\ / `/\ /\ \/\ \  /  __\  ]],
             [[/\ /\ /\  //\ _\ \ \ _/ |\ \ /\ /\ /\ \ ]],
             [[\ _\ _\ _\ _/\ _/  \ _\ _\ _\ _]],
             [[ /////__///  /_/    ///////_/]],
         }
         dashboard.section.buttons.val = {
  	     dashboard.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
             dashboard.button( "q", "  Quit NVIM" , ":qa<CR>"),
             dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
             dashboard.button( "f", "  > Find file", ":cd $HOME/Desktop/javascript | Telescope find_files<CR>"),
             dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
             dashboard.button( "s", "  > Settings" , ":e $MYVIMRC | :cd %:p:h | wincmd k | pwd<CR>"),
             dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),	
         }
         local handle = io.popen('fortune')
         local fortune = handle:read("*a")
         handle:close()
         dashboard.section.footer.val = fortune

         dashboard.config.opts.noautocmd = true

         vim.cmd[[autocmd User AlphaReady echo 'ready']]

         alpha.setup(dashboard.config)
     end,
 }
