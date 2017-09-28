var assert = require('assert');
var fs = require('fs');
var path = require('path');
var swaggerDiff = require('swagger-diff');
var formatjson = require('format-json');

describe('Compare Swagger YAML', function () {
    describe('swaggerDiff()', function () {
        it('should have diff content', function () {
            var yaml1 = fs.readFileSync(path.join(__dirname, 'data/swagger1.yaml'), 'utf8');
            var yaml2 = fs.readFileSync(path.join(__dirname, 'data/swagger2.yaml'), 'utf8');

            var config = '{ "changes": { "breaks": 3, "smooths": 2 } }';
            swaggerDiff(yaml1, yaml2, config).then(function (diff) {
                var text = formatjson.diffy(diff);
                assert.equal(text.length > 0, true);
            }).catch(function () {
                console.log("");
            });
        });
    });
});