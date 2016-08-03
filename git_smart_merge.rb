#!/usr/bin/env ruby

require_relative "lib/branch_parser"
require_relative "lib/branch_selection_prompt"

branches        = BranchParser.new(`git branch`).branches
selected_branch = BranchSelectionPrompt.new(branches).prompt_for_branch_selection

puts # Add a line of whitespace to the output for readability
if selected_branch
  `git merge #{selected_branch}`
  puts "Merged #{selected_branch} into #{`git symbolic-ref --short HEAD`}"
else
  puts "Invalid branch selection"
end
