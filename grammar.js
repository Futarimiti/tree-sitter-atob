/**
 * @file A string-rewriting esolang, from game of the same name
 * @author f <huivioemp1bs@posteo.com>
 * @license WTFPL
 */

/// <reference types="tree-sitter-cli/dsl" />
// @ts-check

export default grammar({
  name: "atob",

  rules: {
    // TODO: add the actual grammar rules
    source_file: $ => "hello"
  }
});
