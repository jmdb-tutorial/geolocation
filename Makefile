verify:
	eslint site/js/**

watch:
	fswatch -o site/js | xargs -n1 -I{} eslint site/js/**
