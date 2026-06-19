package tree_sitter_atob_test

import (
	"testing"

	tree_sitter "github.com/tree-sitter/go-tree-sitter"
	tree_sitter_atob "github.com/futarimiti/tree-sitter-atob/bindings/go"
)

func TestCanLoadGrammar(t *testing.T) {
	language := tree_sitter.NewLanguage(tree_sitter_atob.Language())
	if language == nil {
		t.Errorf("Error loading A=B grammar")
	}
}
