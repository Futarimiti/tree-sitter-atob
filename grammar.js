/**
 * @file A string-rewriting esolang, from game of the same name
 * @author f <huivioemp1bs@posteo.com>
 * @license WTFPL
 */

/// <reference types="tree-sitter-cli/dsl" />
// @ts-check

const newlines = /(\r?\n)+/

const sepBy1 = (sep, a) => seq(
  repeat(seq(a, sep)),
  a
)
const sepBy = (sep, a) => optional(sepBy1(sep, a))

// the "inclusive or": a | b | seq(a, b)
const or = (a, b) => choice(a, b, seq(a, b))

export default grammar({
  name: 'atob',

  extras: $ => [
    $.comment,
    newlines,
  ],

  rules: {
    source_file: $ =>
      sepBy(newlines, $.rule),

    rule: $ => seq(
      optional($.rule_keyword),
      optional($.lhs),
      '=',
      optional($.rhs)
    ),

    lhs: $ => or($.lhs_keyword, $.text),

    rhs: $ => or($.rhs_keyword, $.text),

    lhs_keyword: _ => choice(
      '(start)',
      '(end)'
    ),

    rhs_keyword: _ => choice(
      '(start)',
      '(end)',
      '(return)'
    ),

    rule_keyword: _ => '(once)',

    text: _ => token(/[^\r\n#=()]+/),

    comment: _ => token(/#.*/),
  }
});
