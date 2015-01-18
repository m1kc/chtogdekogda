#!/usr/bin/env coffee

'use strict'


pickRandom = (x) ->
	index = Math.floor(Math.abs(Math.random()*x.length))
	return x[index]


if process.argv.length != 3
	console.log """
unigen - генератор фраз и текстов

Использование: unigen <шаблон>

Доступные шаблоны:"""
	ls = require('fs').readdirSync(__dirname).filter (x) -> /.*[.]json/.test x
	for i in ls
		t = require("#{__dirname}/#{i}")
		w = t.what
		vars = 1
		for zz in t.data
			vars *= zz.length
		console.log " #{i.slice(0,i.length-5)} - #{w}, #{vars} вариантов"
	process.exit 2

data = require("#{__dirname}/#{process.argv[2]}.json").data


# TODO: blacklist

x = ''
for i in data
	x = x + pickRandom(i)

console.log x
