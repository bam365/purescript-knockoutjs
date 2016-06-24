"use strict"; 

// module Knockout.Observable

exports.empty = function() {
    return ko.observable();
};

exports.singleton = function(v) {
    return ko.observable(v);
};

exports.emptyArray = function() {
    return ko.observableArray([]);
};

exports.fromArray = function(arry) {
    return ko.observableArray(arry);
};

exports.computed = function(f) {
    return ko.pureComputed(f);
};

exports.readUndef = function(o) {
    return o();
};

exports.readArray = function(arry) {
    return arry();
};

exports.write = function(o) { 
    return function(v) {
        o(v);
    };
};

exports.writeArray = function(o) {
    return function(a) {
        o(a);
    };
};
