﻿/*
 Highcharts JS v9.0.1 (2021-02-15)

 3D features for Highcharts JS

 License: www.highcharts.com/license
*/
(function (a) { "object" === typeof module && module.exports ? (a["default"] = a, module.exports = a) : "function" === typeof define && define.amd ? define("highcharts/highcharts-3d", ["highcharts"], function (D) { a(D); a.Highcharts = D; return a }) : a("undefined" !== typeof Highcharts ? Highcharts : void 0) })(function (a) {
    function D(a, q, u, C) { a.hasOwnProperty(q) || (a[q] = C.apply(null, u)) } a = a ? a._modules : {}; D(a, "Extensions/Math3D.js", [a["Core/Globals.js"], a["Core/Utilities.js"]], function (a, q) {
        function u(l, c, b) {
            c = 0 < b && b < Number.POSITIVE_INFINITY ?
            b / (l.z + c.z + b) : 1; return { x: l.x * c, y: l.y * c }
        } function G(l, c, b, p) {
            var m = c.options.chart.options3d, d = w(p, b ? c.inverted : !1), e = { x: c.plotWidth / 2, y: c.plotHeight / 2, z: m.depth / 2, vd: w(m.depth, 1) * w(m.viewDistance, 0) }, g = c.scale3d || 1; p = n * m.beta * (d ? -1 : 1); m = n * m.alpha * (d ? -1 : 1); var r = Math.cos(m), f = Math.cos(-p), H = Math.sin(m), a = Math.sin(-p); b || (e.x += c.plotLeft, e.y += c.plotTop); return l.map(function (b) {
                var c = (d ? b.y : b.x) - e.x; var k = (d ? b.x : b.y) - e.y; b = (b.z || 0) - e.z; c = { x: f * c - a * b, y: -H * a * c + r * k - f * H * b, z: r * a * c + H * k + r * f * b }; k = u(c, e, e.vd);
                k.x = k.x * g + e.x; k.y = k.y * g + e.y; k.z = c.z * g + e.z; return { x: d ? k.y : k.x, y: d ? k.x : k.y, z: k.z }
            })
        } function d(d, c) { var b = c.options.chart.options3d, p = c.plotWidth / 2; c = c.plotHeight / 2; b = w(b.depth, 1) * w(b.viewDistance, 0) + b.depth; return Math.sqrt(Math.pow(p - w(d.plotX, d.x), 2) + Math.pow(c - w(d.plotY, d.y), 2) + Math.pow(b - w(d.plotZ, d.z), 2)) } function v(d) { var c = 0, b; for (b = 0; b < d.length; b++) { var p = (b + 1) % d.length; c += d[b].x * d[p].y - d[p].x * d[b].y } return c / 2 } function t(d, c, b) { return v(G(d, c, b)) } var w = q.pick, n = a.deg2rad; a.perspective3D = u;
        a.perspective = G; a.pointCameraDistance = d; a.shapeArea = v; a.shapeArea3d = t; return { perspective: G, perspective3D: u, pointCameraDistance: d, shapeArea: v, shapeArea3D: t }
    }); D(a, "Core/Renderer/SVG/SVGElement3D.js", [a["Core/Color/Color.js"], a["Core/Renderer/SVG/SVGElement.js"], a["Core/Utilities.js"]], function (a, q, u) {
        var G = a.parse, d = u.defined, v = u.merge, t = u.objectEach, w = u.pick, n; (function (a) {
            a.base = {
                initArgs: function (c) {
                    var b = this, d = b.renderer, a = d[b.pathType + "Path"](c), l = a.zIndexes; b.parts.forEach(function (e) {
                        b[e] =
                        d.path(a[e]).attr({ "class": "highcharts-3d-" + e, zIndex: l[e] || 0 }).add(b)
                    }); b.attr({ "stroke-linejoin": "round", zIndex: l.group }); b.originalDestroy = b.destroy; b.destroy = b.destroyParts; b.forcedSides = a.forcedSides
                }, singleSetterForParts: function (c, b, d, a, l, e) { var g = {}; a = [null, null, a || "attr", l, e]; var r = d && d.zIndexes; d ? (r && r.group && this.attr({ zIndex: r.group }), t(d, function (b, e) { g[e] = {}; g[e][c] = b; r && (g[e].zIndex = d.zIndexes[e] || 0) }), a[1] = g) : (g[c] = b, a[0] = g); return this.processParts.apply(this, a) }, processParts: function (c,
                b, d, a, l) { var e = this; e.parts.forEach(function (g) { b && (c = w(b[g], !1)); if (!1 !== c) e[g][d](c, a, l) }); return e }, destroyParts: function () { this.processParts(null, null, "destroy"); return this.originalDestroy() }
            }; a.cuboid = v(a.base, {
                parts: ["front", "top", "side"], pathType: "cuboid", attr: function (c, b, a, l) {
                    if ("string" === typeof c && "undefined" !== typeof b) { var p = c; c = {}; c[p] = b } return c.shapeArgs || d(c.x) ? this.singleSetterForParts("d", null, this.renderer[this.pathType + "Path"](c.shapeArgs || c)) : q.prototype.attr.call(this, c, void 0,
                    a, l)
                }, animate: function (c, b, p) { if (d(c.x) && d(c.y)) { c = this.renderer[this.pathType + "Path"](c); var l = c.forcedSides; this.singleSetterForParts("d", null, c, "animate", b, p); this.attr({ zIndex: c.zIndexes.group }); l !== this.forcedSides && (this.forcedSides = l, a.cuboid.fillSetter.call(this, this.fill)) } else q.prototype.animate.call(this, c, b, p); return this }, fillSetter: function (c) {
                    this.forcedSides = this.forcedSides || []; this.singleSetterForParts("fill", null, {
                        front: c, top: G(c).brighten(0 <= this.forcedSides.indexOf("top") ? 0 :
                        .1).get(), side: G(c).brighten(0 <= this.forcedSides.indexOf("side") ? 0 : -.1).get()
                    }); this.color = this.fill = c; return this
                }
            })
        })(n || (n = {})); return n
    }); D(a, "Core/Renderer/SVG/SVGRenderer3D.js", [a["Core/Animation/AnimationUtilities.js"], a["Core/Color/Color.js"], a["Core/Globals.js"], a["Extensions/Math3D.js"], a["Core/Renderer/SVG/SVGElement.js"], a["Core/Renderer/SVG/SVGElement3D.js"], a["Core/Renderer/SVG/SVGRenderer.js"], a["Core/Utilities.js"]], function (a, q, u, C, d, v, t, w) {
        function n(b, e, c, g, d, f, a, r) {
            var h = [], k =
            f - d; return f > d && f - d > Math.PI / 2 + .0001 ? (h = h.concat(n(b, e, c, g, d, d + Math.PI / 2, a, r)), h = h.concat(n(b, e, c, g, d + Math.PI / 2, f, a, r))) : f < d && d - f > Math.PI / 2 + .0001 ? (h = h.concat(n(b, e, c, g, d, d - Math.PI / 2, a, r)), h = h.concat(n(b, e, c, g, d - Math.PI / 2, f, a, r))) : [["C", b + c * Math.cos(d) - c * E * k * Math.sin(d) + a, e + g * Math.sin(d) + g * E * k * Math.cos(d) + r, b + c * Math.cos(f) + c * E * k * Math.sin(f) + a, e + g * Math.sin(f) - g * E * k * Math.cos(f) + r, b + c * Math.cos(f) + a, e + g * Math.sin(f) + r]]
        } var l = a.animObject, c = q.parse, b = u.charts, p = u.deg2rad, m = C.perspective, x = C.shapeArea, e =
        w.defined, g = w.extend, r = w.merge, f = w.pick, H = Math.cos, J = Math.sin, K = Math.PI, E = 4 * (Math.sqrt(2) - 1) / 3 / (K / 2); t.prototype.elements3d = v; t.prototype.toLinePath = function (b, e) { var c = []; b.forEach(function (b) { c.push(["L", b.x, b.y]) }); b.length && (c[0][0] = "M", e && c.push(["Z"])); return c }; t.prototype.toLineSegments = function (b) { var e = [], c = !0; b.forEach(function (b) { e.push(c ? ["M", b.x, b.y] : ["L", b.x, b.y]); c = !c }); return e }; t.prototype.face3d = function (c) {
            var g = this, h = this.createElement("path"); h.vertexes = []; h.insidePlotArea =
            !1; h.enabled = !0; h.attr = function (c) { if ("object" === typeof c && (e(c.enabled) || e(c.vertexes) || e(c.insidePlotArea))) { this.enabled = f(c.enabled, this.enabled); this.vertexes = f(c.vertexes, this.vertexes); this.insidePlotArea = f(c.insidePlotArea, this.insidePlotArea); delete c.enabled; delete c.vertexes; delete c.insidePlotArea; var h = m(this.vertexes, b[g.chartIndex], this.insidePlotArea), k = g.toLinePath(h, !0); h = x(h); h = this.enabled && 0 < h ? "visible" : "hidden"; c.d = k; c.visibility = h } return d.prototype.attr.apply(this, arguments) };
            h.animate = function (c) { if ("object" === typeof c && (e(c.enabled) || e(c.vertexes) || e(c.insidePlotArea))) { this.enabled = f(c.enabled, this.enabled); this.vertexes = f(c.vertexes, this.vertexes); this.insidePlotArea = f(c.insidePlotArea, this.insidePlotArea); delete c.enabled; delete c.vertexes; delete c.insidePlotArea; var h = m(this.vertexes, b[g.chartIndex], this.insidePlotArea), k = g.toLinePath(h, !0); h = x(h); h = this.enabled && 0 < h ? "visible" : "hidden"; c.d = k; this.attr("visibility", h) } return d.prototype.animate.apply(this, arguments) };
            return h.attr(c)
        }; t.prototype.polyhedron = function (b) {
            var c = this, h = this.g(), g = h.destroy; this.styledMode || h.attr({ "stroke-linejoin": "round" }); h.faces = []; h.destroy = function () { for (var b = 0; b < h.faces.length; b++) h.faces[b].destroy(); return g.call(this) }; h.attr = function (b, g, f, k) {
                if ("object" === typeof b && e(b.faces)) {
                    for (; h.faces.length > b.faces.length;) h.faces.pop().destroy(); for (; h.faces.length < b.faces.length;) h.faces.push(c.face3d().add(h)); for (var a = 0; a < b.faces.length; a++) c.styledMode && delete b.faces[a].fill,
                    h.faces[a].attr(b.faces[a], null, f, k); delete b.faces
                } return d.prototype.attr.apply(this, arguments)
            }; h.animate = function (b, e, g) { if (b && b.faces) { for (; h.faces.length > b.faces.length;) h.faces.pop().destroy(); for (; h.faces.length < b.faces.length;) h.faces.push(c.face3d().add(h)); for (var f = 0; f < b.faces.length; f++) h.faces[f].animate(b.faces[f], e, g); delete b.faces } return d.prototype.animate.apply(this, arguments) }; return h.attr(b)
        }; t.prototype.element3d = function (b, c) {
            var e = this.g(); g(e, this.elements3d[b]); e.initArgs(c);
            return e
        }; t.prototype.cuboid = function (b) { return this.element3d("cuboid", b) }; t.prototype.cuboidPath = function (c) {
            function e(b) { return 0 === k && 1 < b && 6 > b ? { x: I[b].x, y: I[b].y + 10, z: I[b].z } : I[0].x === I[7].x && 4 <= b ? { x: I[b].x + 10, y: I[b].y, z: I[b].z } : 0 === p && 2 > b || 5 < b ? { x: I[b].x, y: I[b].y, z: I[b].z + 10 } : I[b] } function g(b) { return I[b] } var f = c.x, d = c.y, a = c.z || 0, k = c.height, r = c.width, p = c.depth, y = b[this.chartIndex], z = y.options.chart.options3d.alpha, F = 0, I = [{ x: f, y: d, z: a }, { x: f + r, y: d, z: a }, { x: f + r, y: d + k, z: a }, { x: f, y: d + k, z: a }, {
                x: f, y: d +
                k, z: a + p
            }, { x: f + r, y: d + k, z: a + p }, { x: f + r, y: d, z: a + p }, { x: f, y: d, z: a + p }], l = []; I = m(I, y, c.insidePlotArea); var A = function (b, c, z) { var f = [[], -1], d = b.map(g), h = c.map(g); b = b.map(e); c = c.map(e); 0 > x(d) ? f = [d, 0] : 0 > x(h) ? f = [h, 1] : z && (l.push(z), f = 0 > x(b) ? [d, 0] : 0 > x(c) ? [h, 1] : [d, 0]); return f }; var B = A([3, 2, 1, 0], [7, 6, 5, 4], "front"); c = B[0]; var H = B[1]; B = A([1, 6, 7, 0], [4, 5, 2, 3], "top"); r = B[0]; var J = B[1]; B = A([1, 2, 5, 6], [0, 7, 4, 3], "side"); A = B[0]; B = B[1]; 1 === B ? F += 1E6 * (y.plotWidth - f) : B || (F += 1E6 * f); F += 10 * (!J || 0 <= z && 180 >= z || 360 > z && 357.5 < z ? y.plotHeight -
                d : 10 + d); 1 === H ? F += 100 * a : H || (F += 100 * (1E3 - a)); return { front: this.toLinePath(c, !0), top: this.toLinePath(r, !0), side: this.toLinePath(A, !0), zIndexes: { group: Math.round(F) }, forcedSides: l, isFront: H, isTop: J }
        }; t.prototype.arc3d = function (b) {
            function e(b) { var c = !1, e = {}, f; b = r(b); for (f in b) -1 !== k.indexOf(f) && (e[f] = b[f], delete b[f], c = !0); return c ? [e, b] : !1 } var h = this.g(), a = h.renderer, k = "x y r innerR start end depth".split(" "); b = r(b); b.alpha = (b.alpha || 0) * p; b.beta = (b.beta || 0) * p; h.top = a.path(); h.side1 = a.path(); h.side2 =
            a.path(); h.inn = a.path(); h.out = a.path(); h.onAdd = function () { var b = h.parentGroup, c = h.attr("class"); h.top.add(h);["out", "inn", "side1", "side2"].forEach(function (e) { h[e].attr({ "class": c + " highcharts-3d-side" }).add(b) }) };["addClass", "removeClass"].forEach(function (b) { h[b] = function () { var c = arguments;["top", "out", "inn", "side1", "side2"].forEach(function (e) { h[e][b].apply(h[e], c) }) } }); h.setPaths = function (b) {
                var c = h.renderer.arc3dPath(b), e = 100 * c.zTop; h.attribs = b; h.top.attr({ d: c.top, zIndex: c.zTop }); h.inn.attr({
                    d: c.inn,
                    zIndex: c.zInn
                }); h.out.attr({ d: c.out, zIndex: c.zOut }); h.side1.attr({ d: c.side1, zIndex: c.zSide1 }); h.side2.attr({ d: c.side2, zIndex: c.zSide2 }); h.zIndex = e; h.attr({ zIndex: e }); b.center && (h.top.setRadialReference(b.center), delete b.center)
            }; h.setPaths(b); h.fillSetter = function (b) { var e = c(b).brighten(-.1).get(); this.fill = b; this.side1.attr({ fill: e }); this.side2.attr({ fill: e }); this.inn.attr({ fill: e }); this.out.attr({ fill: e }); this.top.attr({ fill: b }); return this };["opacity", "translateX", "translateY", "visibility"].forEach(function (b) {
                h[b +
                "Setter"] = function (b, c) { h[c] = b;["out", "inn", "side1", "side2", "top"].forEach(function (e) { h[e].attr(c, b) }) }
            }); h.attr = function (b) { var c; if ("object" === typeof b && (c = e(b))) { var f = c[0]; arguments[0] = c[1]; g(h.attribs, f); h.setPaths(h.attribs) } return d.prototype.attr.apply(h, arguments) }; h.animate = function (b, c, g) {
                var a = this.attribs, k = "data-" + Math.random().toString(26).substring(2, 9); delete b.center; delete b.z; delete b.alpha; delete b.beta; var z = l(f(c, this.renderer.globalAnimation)); if (z.duration) {
                    c = e(b); h[k] = 0;
                    b[k] = 1; h[k + "Setter"] = u.noop; if (c) { var F = c[0]; z.step = function (b, c) { function e(b) { return a[b] + (f(F[b], a[b]) - a[b]) * c.pos } c.prop === k && c.elem.setPaths(r(a, { x: e("x"), y: e("y"), r: e("r"), innerR: e("innerR"), start: e("start"), end: e("end"), depth: e("depth") })) } } c = z
                } return d.prototype.animate.call(this, b, c, g)
            }; h.destroy = function () { this.top.destroy(); this.out.destroy(); this.inn.destroy(); this.side1.destroy(); this.side2.destroy(); return d.prototype.destroy.call(this) }; h.hide = function () {
                this.top.hide(); this.out.hide();
                this.inn.hide(); this.side1.hide(); this.side2.hide()
            }; h.show = function (b) { this.top.show(b); this.out.show(b); this.inn.show(b); this.side1.show(b); this.side2.show(b) }; return h
        }; t.prototype.arc3dPath = function (b) {
            function c(b) { b %= 2 * Math.PI; b > Math.PI && (b = 2 * Math.PI - b); return b } var e = b.x, f = b.y, d = b.start, g = b.end - .00001, a = b.r, r = b.innerR || 0, k = b.depth || 0, y = b.alpha, z = b.beta, F = Math.cos(d), p = Math.sin(d); b = Math.cos(g); var l = Math.sin(g), A = a * Math.cos(z); a *= Math.cos(y); var B = r * Math.cos(z), m = r * Math.cos(y); r = k * Math.sin(z);
            var t = k * Math.sin(y); k = [["M", e + A * F, f + a * p]]; k = k.concat(n(e, f, A, a, d, g, 0, 0)); k.push(["L", e + B * b, f + m * l]); k = k.concat(n(e, f, B, m, g, d, 0, 0)); k.push(["Z"]); var x = 0 < z ? Math.PI / 2 : 0; z = 0 < y ? 0 : Math.PI / 2; x = d > -x ? d : g > -x ? -x : d; var E = g < K - z ? g : d < K - z ? K - z : g, v = 2 * K - z; y = [["M", e + A * H(x), f + a * J(x)]]; y = y.concat(n(e, f, A, a, x, E, 0, 0)); g > v && d < v ? (y.push(["L", e + A * H(E) + r, f + a * J(E) + t]), y = y.concat(n(e, f, A, a, E, v, r, t)), y.push(["L", e + A * H(v), f + a * J(v)]), y = y.concat(n(e, f, A, a, v, g, 0, 0)), y.push(["L", e + A * H(g) + r, f + a * J(g) + t]), y = y.concat(n(e, f, A, a, g, v, r, t)),
            y.push(["L", e + A * H(v), f + a * J(v)]), y = y.concat(n(e, f, A, a, v, E, 0, 0))) : g > K - z && d < K - z && (y.push(["L", e + A * Math.cos(E) + r, f + a * Math.sin(E) + t]), y = y.concat(n(e, f, A, a, E, g, r, t)), y.push(["L", e + A * Math.cos(g), f + a * Math.sin(g)]), y = y.concat(n(e, f, A, a, g, E, 0, 0))); y.push(["L", e + A * Math.cos(E) + r, f + a * Math.sin(E) + t]); y = y.concat(n(e, f, A, a, E, x, r, t)); y.push(["Z"]); z = [["M", e + B * F, f + m * p]]; z = z.concat(n(e, f, B, m, d, g, 0, 0)); z.push(["L", e + B * Math.cos(g) + r, f + m * Math.sin(g) + t]); z = z.concat(n(e, f, B, m, g, d, r, t)); z.push(["Z"]); F = [["M", e + A * F, f + a * p],
            ["L", e + A * F + r, f + a * p + t], ["L", e + B * F + r, f + m * p + t], ["L", e + B * F, f + m * p], ["Z"]]; e = [["M", e + A * b, f + a * l], ["L", e + A * b + r, f + a * l + t], ["L", e + B * b + r, f + m * l + t], ["L", e + B * b, f + m * l], ["Z"]]; l = Math.atan2(t, -r); f = Math.abs(g + l); b = Math.abs(d + l); d = Math.abs((d + g) / 2 + l); f = c(f); b = c(b); d = c(d); d *= 1E5; g = 1E5 * b; f *= 1E5; return { top: k, zTop: 1E5 * Math.PI + 1, out: y, zOut: Math.max(d, g, f), inn: z, zInn: Math.max(d, g, f), side1: F, zSide1: .99 * f, side2: e, zSide2: .99 * g }
        }; return t
    }); D(a, "Core/Axis/Tick3D.js", [a["Core/Utilities.js"]], function (a) {
        var q = a.addEvent, u = a.extend,
        G = a.wrap; return function () {
            function d() { } d.compose = function (a) { q(a, "afterGetLabelPosition", d.onAfterGetLabelPosition); G(a.prototype, "getMarkPath", d.wrapGetMarkPath) }; d.onAfterGetLabelPosition = function (a) { var d = this.axis.axis3D; d && u(a.pos, d.fix3dPosition(a.pos)) }; d.wrapGetMarkPath = function (a) { var d = this.axis.axis3D, v = a.apply(this, [].slice.call(arguments, 1)); if (d) { var n = v[0], l = v[1]; if ("M" === n[0] && "L" === l[0]) return d = [d.fix3dPosition({ x: n[1], y: n[2], z: 0 }), d.fix3dPosition({ x: l[1], y: l[2], z: 0 })], this.axis.chart.renderer.toLineSegments(d) } return v };
            return d
        }()
    }); D(a, "Core/Axis/Axis3D.js", [a["Core/Globals.js"], a["Extensions/Math3D.js"], a["Core/Axis/Tick.js"], a["Core/Axis/Tick3D.js"], a["Core/Utilities.js"]], function (a, q, u, C, d) {
        var v = q.perspective, t = q.perspective3D, w = q.shapeArea, n = d.addEvent, l = d.merge, c = d.pick, b = d.wrap, p = a.deg2rad, m = function () {
            function b(b) { this.axis = b } b.prototype.fix3dPosition = function (b, d) {
                var e = this.axis, f = e.chart; if ("colorAxis" === e.coll || !f.chart3d || !f.is3d()) return b; var a = p * f.options.chart.options3d.alpha, g = p * f.options.chart.options3d.beta,
                l = c(d && e.options.title.position3d, e.options.labels.position3d); d = c(d && e.options.title.skew3d, e.options.labels.skew3d); var m = f.chart3d.frame3d, k = f.plotLeft, t = f.plotWidth + k, h = f.plotTop, n = f.plotHeight + h; f = !1; var x = 0, u = 0, q = { x: 0, y: 1, z: 0 }; b = e.axis3D.swapZ({ x: b.x, y: b.y, z: 0 }); if (e.isZAxis) if (e.opposite) { if (null === m.axes.z.top) return {}; u = b.y - h; b.x = m.axes.z.top.x; b.y = m.axes.z.top.y; k = m.axes.z.top.xDir; f = !m.top.frontFacing } else {
                    if (null === m.axes.z.bottom) return {}; u = b.y - n; b.x = m.axes.z.bottom.x; b.y = m.axes.z.bottom.y;
                    k = m.axes.z.bottom.xDir; f = !m.bottom.frontFacing
                } else if (e.horiz) if (e.opposite) { if (null === m.axes.x.top) return {}; u = b.y - h; b.y = m.axes.x.top.y; b.z = m.axes.x.top.z; k = m.axes.x.top.xDir; f = !m.top.frontFacing } else { if (null === m.axes.x.bottom) return {}; u = b.y - n; b.y = m.axes.x.bottom.y; b.z = m.axes.x.bottom.z; k = m.axes.x.bottom.xDir; f = !m.bottom.frontFacing } else if (e.opposite) { if (null === m.axes.y.right) return {}; x = b.x - t; b.x = m.axes.y.right.x; b.z = m.axes.y.right.z; k = m.axes.y.right.xDir; k = { x: k.z, y: k.y, z: -k.x } } else {
                    if (null === m.axes.y.left) return {};
                    x = b.x - k; b.x = m.axes.y.left.x; b.z = m.axes.y.left.z; k = m.axes.y.left.xDir
                } "chart" !== l && ("flap" === l ? e.horiz ? (g = Math.sin(a), a = Math.cos(a), e.opposite && (g = -g), f && (g = -g), q = { x: k.z * g, y: a, z: -k.x * g }) : k = { x: Math.cos(g), y: 0, z: Math.sin(g) } : "ortho" === l ? e.horiz ? (q = Math.cos(a), l = Math.sin(g) * q, a = -Math.sin(a), g = -q * Math.cos(g), q = { x: k.y * g - k.z * a, y: k.z * l - k.x * g, z: k.x * a - k.y * l }, a = 1 / Math.sqrt(q.x * q.x + q.y * q.y + q.z * q.z), f && (a = -a), q = { x: a * q.x, y: a * q.y, z: a * q.z }) : k = { x: Math.cos(g), y: 0, z: Math.sin(g) } : e.horiz ? q = {
                    x: Math.sin(g) * Math.sin(a),
                    y: Math.cos(a), z: -Math.cos(g) * Math.sin(a)
                } : k = { x: Math.cos(g), y: 0, z: Math.sin(g) }); b.x += x * k.x + u * q.x; b.y += x * k.y + u * q.y; b.z += x * k.z + u * q.z; f = v([b], e.chart)[0]; d && (0 > w(v([b, { x: b.x + k.x, y: b.y + k.y, z: b.z + k.z }, { x: b.x + q.x, y: b.y + q.y, z: b.z + q.z }], e.chart)) && (k = { x: -k.x, y: -k.y, z: -k.z }), b = v([{ x: b.x, y: b.y, z: b.z }, { x: b.x + k.x, y: b.y + k.y, z: b.z + k.z }, { x: b.x + q.x, y: b.y + q.y, z: b.z + q.z }], e.chart), f.matrix = [b[1].x - b[0].x, b[1].y - b[0].y, b[2].x - b[0].x, b[2].y - b[0].y, f.x, f.y], f.matrix[4] -= f.x * f.matrix[0] + f.y * f.matrix[2], f.matrix[5] -= f.x *
                f.matrix[1] + f.y * f.matrix[3]); return f
            }; b.prototype.swapZ = function (b, c) { var e = this.axis; return e.isZAxis ? (c = c ? 0 : e.chart.plotLeft, { x: c + b.z, y: b.y, z: b.x - c }) : b }; return b
        }(); return function () {
            function a() { } a.compose = function (c) {
                l(!0, c.defaultOptions, a.defaultOptions); c.keepProps.push("axis3D"); n(c, "init", a.onInit); n(c, "afterSetOptions", a.onAfterSetOptions); n(c, "drawCrosshair", a.onDrawCrosshair); n(c, "destroy", a.onDestroy); c = c.prototype; b(c, "getLinePath", a.wrapGetLinePath); b(c, "getPlotBandPath", a.wrapGetPlotBandPath);
                b(c, "getPlotLinePath", a.wrapGetPlotLinePath); b(c, "getSlotWidth", a.wrapGetSlotWidth); b(c, "getTitlePosition", a.wrapGetTitlePosition); C.compose(u)
            }; a.onAfterSetOptions = function () { var b = this.chart, a = this.options; b.is3d && b.is3d() && "colorAxis" !== this.coll && (a.tickWidth = c(a.tickWidth, 0), a.gridLineWidth = c(a.gridLineWidth, 1)) }; a.onDestroy = function () { ["backFrame", "bottomFrame", "sideFrame"].forEach(function (b) { this[b] && (this[b] = this[b].destroy()) }, this) }; a.onDrawCrosshair = function (b) {
                this.chart.is3d() && "colorAxis" !==
                this.coll && b.point && (b.point.crosshairPos = this.isXAxis ? b.point.axisXpos : this.len - b.point.axisYpos)
            }; a.onInit = function () { this.axis3D || (this.axis3D = new m(this)) }; a.wrapGetLinePath = function (b) { return this.chart.is3d() && "colorAxis" !== this.coll ? [] : b.apply(this, [].slice.call(arguments, 1)) }; a.wrapGetPlotBandPath = function (b) {
                if (!this.chart.is3d() || "colorAxis" === this.coll) return b.apply(this, [].slice.call(arguments, 1)); var c = arguments, a = c[2], f = []; c = this.getPlotLinePath({ value: c[1] }); a = this.getPlotLinePath({ value: a });
                if (c && a) for (var e = 0; e < c.length; e += 2) { var d = c[e], m = c[e + 1], l = a[e], k = a[e + 1]; "M" === d[0] && "L" === m[0] && "M" === l[0] && "L" === k[0] && f.push(d, m, k, ["L", l[1], l[2]], ["Z"]) } return f
            }; a.wrapGetPlotLinePath = function (b) {
                var c = this.axis3D, a = this.chart, e = b.apply(this, [].slice.call(arguments, 1)); if ("colorAxis" === this.coll || !a.chart3d || !a.is3d() || null === e) return e; var d = a.options.chart.options3d, m = this.isZAxis ? a.plotWidth : d.depth; d = a.chart3d.frame3d; var l = e[0], p = e[1]; e = []; "M" === l[0] && "L" === p[0] && (c = [c.swapZ({
                    x: l[1], y: l[2],
                    z: 0
                }), c.swapZ({ x: l[1], y: l[2], z: m }), c.swapZ({ x: p[1], y: p[2], z: 0 }), c.swapZ({ x: p[1], y: p[2], z: m })], this.horiz ? (this.isZAxis ? (d.left.visible && e.push(c[0], c[2]), d.right.visible && e.push(c[1], c[3])) : (d.front.visible && e.push(c[0], c[2]), d.back.visible && e.push(c[1], c[3])), d.top.visible && e.push(c[0], c[1]), d.bottom.visible && e.push(c[2], c[3])) : (d.front.visible && e.push(c[0], c[2]), d.back.visible && e.push(c[1], c[3]), d.left.visible && e.push(c[0], c[1]), d.right.visible && e.push(c[2], c[3])), e = v(e, this.chart, !1)); return a.renderer.toLineSegments(e)
            };
            a.wrapGetSlotWidth = function (b, a) {
                var e = this.chart, d = this.ticks, g = this.gridGroup; if (this.categories && e.frameShapes && e.is3d() && g && a && a.label) {
                    g = g.element.childNodes[0].getBBox(); var m = e.frameShapes.left.getBBox(), l = e.options.chart.options3d; e = { x: e.plotWidth / 2, y: e.plotHeight / 2, z: l.depth / 2, vd: c(l.depth, 1) * c(l.viewDistance, 0) }; var p, k; l = a.pos; var n = d[l - 1]; d = d[l + 1]; 0 !== l && n && n.label && n.label.xy && (p = t({ x: n.label.xy.x, y: n.label.xy.y, z: null }, e, e.vd)); d && d.label && d.label.xy && (k = t({
                        x: d.label.xy.x, y: d.label.xy.y,
                        z: null
                    }, e, e.vd)); d = { x: a.label.xy.x, y: a.label.xy.y, z: null }; d = t(d, e, e.vd); return Math.abs(p ? d.x - p.x : k ? k.x - d.x : g.x - m.x)
                } return b.apply(this, [].slice.call(arguments, 1))
            }; a.wrapGetTitlePosition = function (b) { var c = b.apply(this, [].slice.call(arguments, 1)); return this.axis3D ? this.axis3D.fix3dPosition(c, !0) : c }; a.defaultOptions = { labels: { position3d: "offset", skew3d: !1 }, title: { position3d: null, skew3d: null } }; return a
        }()
    }); D(a, "Core/Axis/ZAxis.js", [a["Core/Axis/Axis.js"], a["Core/Utilities.js"]], function (a, q) {
        var u =
        this && this.__extends || function () { var a = function (c, b) { a = Object.setPrototypeOf || { __proto__: [] } instanceof Array && function (b, c) { b.__proto__ = c } || function (b, c) { for (var a in c) c.hasOwnProperty(a) && (b[a] = c[a]) }; return a(c, b) }; return function (c, b) { function d() { this.constructor = c } a(c, b); c.prototype = null === b ? Object.create(b) : (d.prototype = b.prototype, new d) } }(), G = q.addEvent, d = q.merge, v = q.pick, t = q.splat, w = function () {
            function a() { } a.compose = function (c) {
                G(c, "afterGetAxes", a.onAfterGetAxes); c = c.prototype; c.addZAxis =
                a.wrapAddZAxis; c.collectionsWithInit.zAxis = [c.addZAxis]; c.collectionsWithUpdate.push("zAxis")
            }; a.onAfterGetAxes = function () { var c = this, b = this.options; b = b.zAxis = t(b.zAxis || {}); c.is3d() && (c.zAxis = [], b.forEach(function (b, a) { b.index = a; b.isX = !0; c.addZAxis(b).setScale() })) }; a.wrapAddZAxis = function (c) { return new n(this, c) }; return a
        }(), n = function (a) {
            function c(b, c) { b = a.call(this, b, c) || this; b.isZAxis = !0; return b } u(c, a); c.prototype.getSeriesExtremes = function () {
                var b = this, c = b.chart; b.hasVisibleSeries = !1; b.dataMin =
                b.dataMax = b.ignoreMinPadding = b.ignoreMaxPadding = void 0; b.stacking && b.stacking.buildStacks(); b.series.forEach(function (a) { !a.visible && c.options.chart && c.options.chart.ignoreHiddenSeries || (b.hasVisibleSeries = !0, a = a.zData, a.length && (b.dataMin = Math.min(v(b.dataMin, a[0]), Math.min.apply(null, a)), b.dataMax = Math.max(v(b.dataMax, a[0]), Math.max.apply(null, a)))) })
            }; c.prototype.setAxisSize = function () {
                var b = this.chart; a.prototype.setAxisSize.call(this); this.width = this.len = b.options.chart && b.options.chart.options3d &&
                b.options.chart.options3d.depth || 0; this.right = b.chartWidth - this.width - this.left
            }; c.prototype.setOptions = function (b) { b = d({ offset: 0, lineWidth: 0 }, b); this.isZAxis = !0; a.prototype.setOptions.call(this, b); this.coll = "zAxis" }; c.ZChartComposition = w; return c
        }(a); return n
    }); D(a, "Core/Chart/Chart3D.js", [a["Core/Axis/Axis.js"], a["Core/Axis/Axis3D.js"], a["Core/Chart/Chart.js"], a["Core/Animation/Fx.js"], a["Core/Globals.js"], a["Extensions/Math3D.js"], a["Core/Options.js"], a["Core/Utilities.js"], a["Core/Axis/ZAxis.js"]],
    function (a, q, u, C, d, v, t, w, n) {
        var l = v.perspective, c = v.shapeArea3D, b = t.defaultOptions, p = w.addEvent, m = w.isArray, x = w.merge, e = w.pick, g = w.wrap, r; (function (a) {
            function f(b) { this.is3d() && "scatter" === b.options.type && (b.options.type = "scatter3d") } function r() {
                if (this.chart3d && this.is3d()) {
                    var b = this.renderer, c = this.options.chart.options3d, a = this.chart3d.get3dFrame(), e = this.plotLeft, f = this.plotLeft + this.plotWidth, g = this.plotTop, k = this.plotTop + this.plotHeight; c = c.depth; var h = e - (a.left.visible ? a.left.size : 0), l =
                    f + (a.right.visible ? a.right.size : 0), m = g - (a.top.visible ? a.top.size : 0), p = k + (a.bottom.visible ? a.bottom.size : 0), r = 0 - (a.front.visible ? a.front.size : 0), n = c + (a.back.visible ? a.back.size : 0), t = this.hasRendered ? "animate" : "attr"; this.chart3d.frame3d = a; this.frameShapes || (this.frameShapes = { bottom: b.polyhedron().add(), top: b.polyhedron().add(), left: b.polyhedron().add(), right: b.polyhedron().add(), back: b.polyhedron().add(), front: b.polyhedron().add() }); this.frameShapes.bottom[t]({
                        "class": "highcharts-3d-frame highcharts-3d-frame-bottom",
                        zIndex: a.bottom.frontFacing ? -1E3 : 1E3, faces: [{ fill: d.color(a.bottom.color).brighten(.1).get(), vertexes: [{ x: h, y: p, z: r }, { x: l, y: p, z: r }, { x: l, y: p, z: n }, { x: h, y: p, z: n }], enabled: a.bottom.visible }, { fill: d.color(a.bottom.color).brighten(.1).get(), vertexes: [{ x: e, y: k, z: c }, { x: f, y: k, z: c }, { x: f, y: k, z: 0 }, { x: e, y: k, z: 0 }], enabled: a.bottom.visible }, { fill: d.color(a.bottom.color).brighten(-.1).get(), vertexes: [{ x: h, y: p, z: r }, { x: h, y: p, z: n }, { x: e, y: k, z: c }, { x: e, y: k, z: 0 }], enabled: a.bottom.visible && !a.left.visible }, {
                            fill: d.color(a.bottom.color).brighten(-.1).get(),
                            vertexes: [{ x: l, y: p, z: n }, { x: l, y: p, z: r }, { x: f, y: k, z: 0 }, { x: f, y: k, z: c }], enabled: a.bottom.visible && !a.right.visible
                        }, { fill: d.color(a.bottom.color).get(), vertexes: [{ x: l, y: p, z: r }, { x: h, y: p, z: r }, { x: e, y: k, z: 0 }, { x: f, y: k, z: 0 }], enabled: a.bottom.visible && !a.front.visible }, { fill: d.color(a.bottom.color).get(), vertexes: [{ x: h, y: p, z: n }, { x: l, y: p, z: n }, { x: f, y: k, z: c }, { x: e, y: k, z: c }], enabled: a.bottom.visible && !a.back.visible }]
                    }); this.frameShapes.top[t]({
                        "class": "highcharts-3d-frame highcharts-3d-frame-top", zIndex: a.top.frontFacing ?
                        -1E3 : 1E3, faces: [{ fill: d.color(a.top.color).brighten(.1).get(), vertexes: [{ x: h, y: m, z: n }, { x: l, y: m, z: n }, { x: l, y: m, z: r }, { x: h, y: m, z: r }], enabled: a.top.visible }, { fill: d.color(a.top.color).brighten(.1).get(), vertexes: [{ x: e, y: g, z: 0 }, { x: f, y: g, z: 0 }, { x: f, y: g, z: c }, { x: e, y: g, z: c }], enabled: a.top.visible }, { fill: d.color(a.top.color).brighten(-.1).get(), vertexes: [{ x: h, y: m, z: n }, { x: h, y: m, z: r }, { x: e, y: g, z: 0 }, { x: e, y: g, z: c }], enabled: a.top.visible && !a.left.visible }, {
                            fill: d.color(a.top.color).brighten(-.1).get(), vertexes: [{
                                x: l,
                                y: m, z: r
                            }, { x: l, y: m, z: n }, { x: f, y: g, z: c }, { x: f, y: g, z: 0 }], enabled: a.top.visible && !a.right.visible
                        }, { fill: d.color(a.top.color).get(), vertexes: [{ x: h, y: m, z: r }, { x: l, y: m, z: r }, { x: f, y: g, z: 0 }, { x: e, y: g, z: 0 }], enabled: a.top.visible && !a.front.visible }, { fill: d.color(a.top.color).get(), vertexes: [{ x: l, y: m, z: n }, { x: h, y: m, z: n }, { x: e, y: g, z: c }, { x: f, y: g, z: c }], enabled: a.top.visible && !a.back.visible }]
                    }); this.frameShapes.left[t]({
                        "class": "highcharts-3d-frame highcharts-3d-frame-left", zIndex: a.left.frontFacing ? -1E3 : 1E3, faces: [{
                            fill: d.color(a.left.color).brighten(.1).get(),
                            vertexes: [{ x: h, y: p, z: r }, { x: e, y: k, z: 0 }, { x: e, y: k, z: c }, { x: h, y: p, z: n }], enabled: a.left.visible && !a.bottom.visible
                        }, { fill: d.color(a.left.color).brighten(.1).get(), vertexes: [{ x: h, y: m, z: n }, { x: e, y: g, z: c }, { x: e, y: g, z: 0 }, { x: h, y: m, z: r }], enabled: a.left.visible && !a.top.visible }, { fill: d.color(a.left.color).brighten(-.1).get(), vertexes: [{ x: h, y: p, z: n }, { x: h, y: m, z: n }, { x: h, y: m, z: r }, { x: h, y: p, z: r }], enabled: a.left.visible }, {
                            fill: d.color(a.left.color).brighten(-.1).get(), vertexes: [{ x: e, y: g, z: c }, { x: e, y: k, z: c }, { x: e, y: k, z: 0 },
                            { x: e, y: g, z: 0 }], enabled: a.left.visible
                        }, { fill: d.color(a.left.color).get(), vertexes: [{ x: h, y: p, z: r }, { x: h, y: m, z: r }, { x: e, y: g, z: 0 }, { x: e, y: k, z: 0 }], enabled: a.left.visible && !a.front.visible }, { fill: d.color(a.left.color).get(), vertexes: [{ x: h, y: m, z: n }, { x: h, y: p, z: n }, { x: e, y: k, z: c }, { x: e, y: g, z: c }], enabled: a.left.visible && !a.back.visible }]
                    }); this.frameShapes.right[t]({
                        "class": "highcharts-3d-frame highcharts-3d-frame-right", zIndex: a.right.frontFacing ? -1E3 : 1E3, faces: [{
                            fill: d.color(a.right.color).brighten(.1).get(),
                            vertexes: [{ x: l, y: p, z: n }, { x: f, y: k, z: c }, { x: f, y: k, z: 0 }, { x: l, y: p, z: r }], enabled: a.right.visible && !a.bottom.visible
                        }, { fill: d.color(a.right.color).brighten(.1).get(), vertexes: [{ x: l, y: m, z: r }, { x: f, y: g, z: 0 }, { x: f, y: g, z: c }, { x: l, y: m, z: n }], enabled: a.right.visible && !a.top.visible }, { fill: d.color(a.right.color).brighten(-.1).get(), vertexes: [{ x: f, y: g, z: 0 }, { x: f, y: k, z: 0 }, { x: f, y: k, z: c }, { x: f, y: g, z: c }], enabled: a.right.visible }, {
                            fill: d.color(a.right.color).brighten(-.1).get(), vertexes: [{ x: l, y: p, z: r }, { x: l, y: m, z: r }, {
                                x: l, y: m,
                                z: n
                            }, { x: l, y: p, z: n }], enabled: a.right.visible
                        }, { fill: d.color(a.right.color).get(), vertexes: [{ x: l, y: m, z: r }, { x: l, y: p, z: r }, { x: f, y: k, z: 0 }, { x: f, y: g, z: 0 }], enabled: a.right.visible && !a.front.visible }, { fill: d.color(a.right.color).get(), vertexes: [{ x: l, y: p, z: n }, { x: l, y: m, z: n }, { x: f, y: g, z: c }, { x: f, y: k, z: c }], enabled: a.right.visible && !a.back.visible }]
                    }); this.frameShapes.back[t]({
                        "class": "highcharts-3d-frame highcharts-3d-frame-back", zIndex: a.back.frontFacing ? -1E3 : 1E3, faces: [{
                            fill: d.color(a.back.color).brighten(.1).get(),
                            vertexes: [{ x: l, y: p, z: n }, { x: h, y: p, z: n }, { x: e, y: k, z: c }, { x: f, y: k, z: c }], enabled: a.back.visible && !a.bottom.visible
                        }, { fill: d.color(a.back.color).brighten(.1).get(), vertexes: [{ x: h, y: m, z: n }, { x: l, y: m, z: n }, { x: f, y: g, z: c }, { x: e, y: g, z: c }], enabled: a.back.visible && !a.top.visible }, { fill: d.color(a.back.color).brighten(-.1).get(), vertexes: [{ x: h, y: p, z: n }, { x: h, y: m, z: n }, { x: e, y: g, z: c }, { x: e, y: k, z: c }], enabled: a.back.visible && !a.left.visible }, {
                            fill: d.color(a.back.color).brighten(-.1).get(), vertexes: [{ x: l, y: m, z: n }, {
                                x: l, y: p,
                                z: n
                            }, { x: f, y: k, z: c }, { x: f, y: g, z: c }], enabled: a.back.visible && !a.right.visible
                        }, { fill: d.color(a.back.color).get(), vertexes: [{ x: e, y: g, z: c }, { x: f, y: g, z: c }, { x: f, y: k, z: c }, { x: e, y: k, z: c }], enabled: a.back.visible }, { fill: d.color(a.back.color).get(), vertexes: [{ x: h, y: p, z: n }, { x: l, y: p, z: n }, { x: l, y: m, z: n }, { x: h, y: m, z: n }], enabled: a.back.visible }]
                    }); this.frameShapes.front[t]({
                        "class": "highcharts-3d-frame highcharts-3d-frame-front", zIndex: a.front.frontFacing ? -1E3 : 1E3, faces: [{
                            fill: d.color(a.front.color).brighten(.1).get(),
                            vertexes: [{ x: h, y: p, z: r }, { x: l, y: p, z: r }, { x: f, y: k, z: 0 }, { x: e, y: k, z: 0 }], enabled: a.front.visible && !a.bottom.visible
                        }, { fill: d.color(a.front.color).brighten(.1).get(), vertexes: [{ x: l, y: m, z: r }, { x: h, y: m, z: r }, { x: e, y: g, z: 0 }, { x: f, y: g, z: 0 }], enabled: a.front.visible && !a.top.visible }, { fill: d.color(a.front.color).brighten(-.1).get(), vertexes: [{ x: h, y: m, z: r }, { x: h, y: p, z: r }, { x: e, y: k, z: 0 }, { x: e, y: g, z: 0 }], enabled: a.front.visible && !a.left.visible }, {
                            fill: d.color(a.front.color).brighten(-.1).get(), vertexes: [{ x: l, y: p, z: r }, {
                                x: l,
                                y: m, z: r
                            }, { x: f, y: g, z: 0 }, { x: f, y: k, z: 0 }], enabled: a.front.visible && !a.right.visible
                        }, { fill: d.color(a.front.color).get(), vertexes: [{ x: f, y: g, z: 0 }, { x: e, y: g, z: 0 }, { x: e, y: k, z: 0 }, { x: f, y: k, z: 0 }], enabled: a.front.visible }, { fill: d.color(a.front.color).get(), vertexes: [{ x: l, y: p, z: r }, { x: h, y: p, z: r }, { x: h, y: m, z: r }, { x: l, y: m, z: r }], enabled: a.front.visible }]
                    })
                }
            } function n() {
                this.styledMode && (this.renderer.definition({ tagName: "style", textContent: ".highcharts-3d-top{filter: url(#highcharts-brighter)}\n.highcharts-3d-side{filter: url(#highcharts-darker)}\n" }),
                [{ name: "darker", slope: .6 }, { name: "brighter", slope: 1.4 }].forEach(function (b) { this.renderer.definition({ tagName: "filter", attributes: { id: "highcharts-" + b.name }, children: [{ tagName: "feComponentTransfer", children: [{ tagName: "feFuncR", attributes: { type: "linear", slope: b.slope } }, { tagName: "feFuncG", attributes: { type: "linear", slope: b.slope } }, { tagName: "feFuncB", attributes: { type: "linear", slope: b.slope } }] }] }) }, this))
            } function t() {
                var b = this.options; this.is3d() && (b.series || []).forEach(function (a) {
                    "scatter" === (a.type ||
                    b.chart.type || b.chart.defaultSeriesType) && (a.type = "scatter3d")
                })
            } function k() {
                var b = this.options.chart.options3d; if (this.chart3d && this.is3d()) {
                    b && (b.alpha = b.alpha % 360 + (0 <= b.alpha ? 0 : 360), b.beta = b.beta % 360 + (0 <= b.beta ? 0 : 360)); var a = this.inverted, c = this.clipBox, e = this.margin; c[a ? "y" : "x"] = -(e[3] || 0); c[a ? "x" : "y"] = -(e[0] || 0); c[a ? "height" : "width"] = this.chartWidth + (e[3] || 0) + (e[1] || 0); c[a ? "width" : "height"] = this.chartHeight + (e[0] || 0) + (e[2] || 0); this.scale3d = 1; !0 === b.fitToPlot && (this.scale3d = this.chart3d.getScale(b.depth));
                    this.chart3d.frame3d = this.chart3d.get3dFrame()
                }
            } function q() { this.is3d() && (this.isDirtyBox = !0) } function h() { this.chart3d && this.is3d() && (this.chart3d.frame3d = this.chart3d.get3dFrame()) } function v() { this.chart3d || (this.chart3d = new C(this)) } function u(b) { return this.is3d() || b.apply(this, [].slice.call(arguments, 1)) } function w(b) { var a = this.series.length; if (this.is3d()) for (; a--;) b = this.series[a], b.translate(), b.render(); else b.call(this) } function G(b) {
                b.apply(this, [].slice.call(arguments, 1)); this.is3d() &&
                (this.container.className += " highcharts-3d-chart")
            } var C = function () {
                function b(b) { this.frame3d = void 0; this.chart = b } b.prototype.get3dFrame = function () {
                    var b = this.chart, a = b.options.chart.options3d, d = a.frame, f = b.plotLeft, g = b.plotLeft + b.plotWidth, k = b.plotTop, h = b.plotTop + b.plotHeight, m = a.depth, p = function (a) { a = c(a, b); return .5 < a ? 1 : -.5 > a ? -1 : 0 }, r = p([{ x: f, y: h, z: m }, { x: g, y: h, z: m }, { x: g, y: h, z: 0 }, { x: f, y: h, z: 0 }]), n = p([{ x: f, y: k, z: 0 }, { x: g, y: k, z: 0 }, { x: g, y: k, z: m }, { x: f, y: k, z: m }]), t = p([{ x: f, y: k, z: 0 }, { x: f, y: k, z: m }, {
                        x: f,
                        y: h, z: m
                    }, { x: f, y: h, z: 0 }]), q = p([{ x: g, y: k, z: m }, { x: g, y: k, z: 0 }, { x: g, y: h, z: 0 }, { x: g, y: h, z: m }]), v = p([{ x: f, y: h, z: 0 }, { x: g, y: h, z: 0 }, { x: g, y: k, z: 0 }, { x: f, y: k, z: 0 }]); p = p([{ x: f, y: k, z: m }, { x: g, y: k, z: m }, { x: g, y: h, z: m }, { x: f, y: h, z: m }]); var u = !1, J = !1, w = !1, H = !1;[].concat(b.xAxis, b.yAxis, b.zAxis).forEach(function (b) { b && (b.horiz ? b.opposite ? J = !0 : u = !0 : b.opposite ? H = !0 : w = !0) }); var x = function (b, a, c) {
                        for (var d = ["size", "color", "visible"], f = {}, g = 0; g < d.length; g++) for (var k = d[g], h = 0; h < b.length; h++) if ("object" === typeof b[h]) {
                            var m = b[h][k];
                            if ("undefined" !== typeof m && null !== m) { f[k] = m; break }
                        } b = c; !0 === f.visible || !1 === f.visible ? b = f.visible : "auto" === f.visible && (b = 0 < a); return { size: e(f.size, 1), color: e(f.color, "none"), frontFacing: 0 < a, visible: b }
                    }; d = { axes: {}, bottom: x([d.bottom, d.top, d], r, u), top: x([d.top, d.bottom, d], n, J), left: x([d.left, d.right, d.side, d], t, w), right: x([d.right, d.left, d.side, d], q, H), back: x([d.back, d.front, d], p, !0), front: x([d.front, d.back, d], v, !1) }; "auto" === a.axisLabelPosition ? (q = function (b, a) {
                        return b.visible !== a.visible || b.visible &&
                        a.visible && b.frontFacing !== a.frontFacing
                    }, a = [], q(d.left, d.front) && a.push({ y: (k + h) / 2, x: f, z: 0, xDir: { x: 1, y: 0, z: 0 } }), q(d.left, d.back) && a.push({ y: (k + h) / 2, x: f, z: m, xDir: { x: 0, y: 0, z: -1 } }), q(d.right, d.front) && a.push({ y: (k + h) / 2, x: g, z: 0, xDir: { x: 0, y: 0, z: 1 } }), q(d.right, d.back) && a.push({ y: (k + h) / 2, x: g, z: m, xDir: { x: -1, y: 0, z: 0 } }), r = [], q(d.bottom, d.front) && r.push({ x: (f + g) / 2, y: h, z: 0, xDir: { x: 1, y: 0, z: 0 } }), q(d.bottom, d.back) && r.push({ x: (f + g) / 2, y: h, z: m, xDir: { x: -1, y: 0, z: 0 } }), n = [], q(d.top, d.front) && n.push({
                        x: (f + g) / 2, y: k, z: 0,
                        xDir: { x: 1, y: 0, z: 0 }
                    }), q(d.top, d.back) && n.push({ x: (f + g) / 2, y: k, z: m, xDir: { x: -1, y: 0, z: 0 } }), t = [], q(d.bottom, d.left) && t.push({ z: (0 + m) / 2, y: h, x: f, xDir: { x: 0, y: 0, z: -1 } }), q(d.bottom, d.right) && t.push({ z: (0 + m) / 2, y: h, x: g, xDir: { x: 0, y: 0, z: 1 } }), h = [], q(d.top, d.left) && h.push({ z: (0 + m) / 2, y: k, x: f, xDir: { x: 0, y: 0, z: -1 } }), q(d.top, d.right) && h.push({ z: (0 + m) / 2, y: k, x: g, xDir: { x: 0, y: 0, z: 1 } }), f = function (a, c, e) {
                        if (0 === a.length) return null; if (1 === a.length) return a[0]; for (var d = 0, f = l(a, b, !1), g = 1; g < f.length; g++) e * f[g][c] > e * f[d][c] ? d =
                                g : e * f[g][c] === e * f[d][c] && f[g].z < f[d].z && (d = g); return a[d]
                    }, d.axes = { y: { left: f(a, "x", -1), right: f(a, "x", 1) }, x: { top: f(n, "y", -1), bottom: f(r, "y", 1) }, z: { top: f(h, "y", -1), bottom: f(t, "y", 1) } }) : d.axes = { y: { left: { x: f, z: 0, xDir: { x: 1, y: 0, z: 0 } }, right: { x: g, z: 0, xDir: { x: 0, y: 0, z: 1 } } }, x: { top: { y: k, z: 0, xDir: { x: 1, y: 0, z: 0 } }, bottom: { y: h, z: 0, xDir: { x: 1, y: 0, z: 0 } } }, z: { top: { x: w ? g : f, y: k, xDir: w ? { x: 0, y: 0, z: 1 } : { x: 0, y: 0, z: -1 } }, bottom: { x: w ? g : f, y: h, xDir: w ? { x: 0, y: 0, z: 1 } : { x: 0, y: 0, z: -1 } } } }; return d
                }; b.prototype.getScale = function (b) {
                    var a =
                    this.chart, c = a.plotLeft, e = a.plotWidth + c, d = a.plotTop, f = a.plotHeight + d, g = c + a.plotWidth / 2, k = d + a.plotHeight / 2, h = Number.MAX_VALUE, m = -Number.MAX_VALUE, p = Number.MAX_VALUE, r = -Number.MAX_VALUE, n = 1; var t = [{ x: c, y: d, z: 0 }, { x: c, y: d, z: b }];[0, 1].forEach(function (b) { t.push({ x: e, y: t[b].y, z: t[b].z }) });[0, 1, 2, 3].forEach(function (b) { t.push({ x: t[b].x, y: f, z: t[b].z }) }); t = l(t, a, !1); t.forEach(function (b) { h = Math.min(h, b.x); m = Math.max(m, b.x); p = Math.min(p, b.y); r = Math.max(r, b.y) }); c > h && (n = Math.min(n, 1 - Math.abs((c + g) / (h + g)) % 1));
                    e < m && (n = Math.min(n, (e - g) / (m - g))); d > p && (n = 0 > p ? Math.min(n, (d + k) / (-p + d + k)) : Math.min(n, 1 - (d + k) / (p + k) % 1)); f < r && (n = Math.min(n, Math.abs((f - k) / (r - k)))); return n
                }; return b
            }(); a.Composition = C; a.defaultOptions = { chart: { options3d: { enabled: !1, alpha: 0, beta: 0, depth: 100, fitToPlot: !0, viewDistance: 25, axisLabelPosition: null, frame: { visible: "default", size: 1, bottom: {}, top: {}, left: {}, right: {}, back: {}, front: {} } } } }; a.compose = function (c, e) {
                var l = c.prototype; e = e.prototype; l.is3d = function () {
                    return this.options.chart.options3d &&
                    this.options.chart.options3d.enabled
                }; l.propsRequireDirtyBox.push("chart.options3d"); l.propsRequireUpdateSeries.push("chart.options3d"); e.matrixSetter = function () { if (1 > this.pos && (m(this.start) || m(this.end))) { var b = this.start || [1, 0, 0, 1, 0, 0], a = this.end || [1, 0, 0, 1, 0, 0]; var c = []; for (var e = 0; 6 > e; e++) c.push(this.pos * a[e] + (1 - this.pos) * b[e]) } else c = this.end; this.elem.attr(this.prop, c, null, !0) }; x(!0, b, a.defaultOptions); p(c, "init", v); p(c, "addSeries", f); p(c, "afterDrawChartBox", r); p(c, "afterGetContainer", n); p(c,
                "afterInit", t); p(c, "afterSetChartSize", k); p(c, "beforeRedraw", q); p(c, "beforeRender", h); g(d.Chart.prototype, "isInsidePlot", u); g(c, "renderSeries", w); g(c, "setClassName", G)
            }
        })(r || (r = {})); r.compose(u, C); n.ZChartComposition.compose(u); q.compose(a); ""; return r
    }); D(a, "Core/Series/Series3D.js", [a["Extensions/Math3D.js"], a["Core/Series/Series.js"], a["Core/Utilities.js"]], function (a, q, u) {
        var G = this && this.__extends || function () {
            var a = function (c, b) {
                a = Object.setPrototypeOf || { __proto__: [] } instanceof Array && function (b,
                a) { b.__proto__ = a } || function (b, a) { for (var c in a) a.hasOwnProperty(c) && (b[c] = a[c]) }; return a(c, b)
            }; return function (c, b) { function d() { this.constructor = c } a(c, b); c.prototype = null === b ? Object.create(b) : (d.prototype = b.prototype, new d) }
        }(), d = a.perspective; a = u.addEvent; var v = u.extend, t = u.merge, w = u.pick, n = u.isNumber; u = function (a) {
            function c() { return null !== a && a.apply(this, arguments) || this } G(c, a); c.prototype.translate = function () { a.prototype.translate.apply(this, arguments); this.chart.is3d() && this.translate3dPoints() };
            c.prototype.translate3dPoints = function () {
                var b = this.options, a = this.chart, c = w(this.zAxis, a.options.zAxis[0]), l = [], e, g = []; this.zPadding = (b.stacking ? n(b.stack) ? b.stack : 0 : this.index || 0) * (b.depth || 0 + (b.groupZPadding || 1)); for (e = 0; e < this.data.length; e++) {
                    b = this.data[e]; if (c && c.translate) { var r = c.logarithmic && c.val2lin ? c.val2lin(b.z) : b.z; b.plotZ = c.translate(r); b.isInside = b.isInside ? r >= c.min && r <= c.max : !1 } else b.plotZ = this.zPadding; b.axisXpos = b.plotX; b.axisYpos = b.plotY; b.axisZpos = b.plotZ; l.push({
                        x: b.plotX,
                        y: b.plotY, z: b.plotZ
                    }); g.push(b.plotX || 0)
                } this.rawPointsX = g; a = d(l, a, !0); for (e = 0; e < this.data.length; e++) b = this.data[e], c = a[e], b.plotX = c.x, b.plotY = c.y, b.plotZ = c.z
            }; c.defaultOptions = t(q.defaultOptions); return c
        }(q); a(q, "afterTranslate", function () { this.chart.is3d() && this.translate3dPoints() }); v(q.prototype, { translate3dPoints: u.prototype.translate3dPoints }); return u
    }); D(a, "Series/Column3D/Column3DComposition.js", [a["Series/Column/ColumnSeries.js"], a["Core/Globals.js"], a["Core/Series/Series.js"], a["Extensions/Math3D.js"],
    a["Core/Series/SeriesRegistry.js"], a["Extensions/Stacking.js"], a["Core/Utilities.js"]], function (a, q, u, C, d, v, t) {
        function w(b, a) { var c = b.series, e = {}, d, g = 1; c.forEach(function (b) { d = x(b.options.stack, a ? 0 : c.length - 1 - b.index); e[d] ? e[d].series.push(b) : (e[d] = { series: [b], position: g }, g++) }); e.totalStacks = g + 1; return e } function n(b) { var a = b.apply(this, [].slice.call(arguments, 1)); this.chart.is3d && this.chart.is3d() && (a.stroke = this.options.edgeColor || a.fill, a["stroke-width"] = x(this.options.edgeWidth, 1)); return a }
        function l(b, a, c) { var d = this.chart.is3d && this.chart.is3d(); d && (this.options.inactiveOtherPoints = !0); b.call(this, a, c); d && (this.options.inactiveOtherPoints = !1) } function c(b) { for (var a = [], c = 1; c < arguments.length; c++) a[c - 1] = arguments[c]; return this.series.chart.is3d() ? this.graphic && "g" !== this.graphic.element.nodeName : b.apply(this, a) } var b = a.prototype, p = q.svg, m = C.perspective; q = t.addEvent; var x = t.pick; t = t.wrap; t(b, "translate", function (b) { b.apply(this, [].slice.call(arguments, 1)); this.chart.is3d() && this.translate3dShapes() });
        t(u.prototype, "justifyDataLabel", function (b) { return arguments[2].outside3dPlot ? !1 : b.apply(this, [].slice.call(arguments, 1)) }); b.translate3dPoints = function () { }; b.translate3dShapes = function () {
            var b = this, a = b.chart, c = b.options, d = c.depth, l = (c.stacking ? c.stack || 0 : b.index) * (d + (c.groupZPadding || 1)), p = b.borderWidth % 2 ? .5 : 0, n; a.inverted && !b.yAxis.reversed && (p *= -1); !1 !== c.grouping && (l = 0); l += c.groupZPadding || 1; b.data.forEach(function (c) {
                c.outside3dPlot = null; if (null !== c.y) {
                    var e = c.shapeArgs, f = c.tooltipPos, g;[["x",
                    "width"], ["y", "height"]].forEach(function (a) { g = e[a[0]] - p; 0 > g && (e[a[1]] += e[a[0]] + p, e[a[0]] = -p, g = 0); g + e[a[1]] > b[a[0] + "Axis"].len && 0 !== e[a[1]] && (e[a[1]] = b[a[0] + "Axis"].len - e[a[0]]); if (0 !== e[a[1]] && (e[a[0]] >= b[a[0] + "Axis"].len || e[a[0]] + e[a[1]] <= p)) { for (var d in e) e[d] = 0; c.outside3dPlot = !0 } }); "rect" === c.shapeType && (c.shapeType = "cuboid"); e.z = l; e.depth = d; e.insidePlotArea = !0; n = { x: e.x + e.width / 2, y: e.y, z: l + d / 2 }; a.inverted && (n.x = e.height, n.y = c.clientX); c.plot3d = m([n], a, !0, !1)[0]; f = m([{ x: f[0], y: f[1], z: l + d / 2 }],
                    a, !0, !1)[0]; c.tooltipPos = [f.x, f.y]
                }
            }); b.z = l
        }; t(b, "animate", function (b) {
            if (this.chart.is3d()) {
                var a = arguments[1], c = this.yAxis, d = this, e = this.yAxis.reversed; p && (a ? d.data.forEach(function (b) { null !== b.y && (b.height = b.shapeArgs.height, b.shapey = b.shapeArgs.y, b.shapeArgs.height = 1, e || (b.shapeArgs.y = b.stackY ? b.plotY + c.translate(b.stackY) : b.plotY + (b.negative ? -b.height : b.height))) }) : (d.data.forEach(function (b) {
                    null !== b.y && (b.shapeArgs.height = b.height, b.shapeArgs.y = b.shapey, b.graphic && b.graphic.animate(b.shapeArgs,
                    d.options.animation))
                }), this.drawDataLabels()))
            } else b.apply(this, [].slice.call(arguments, 1))
        }); t(b, "plotGroup", function (b, a, c, d, m, l) {
            "dataLabelsGroup" !== a && this.chart.is3d() && (this[a] && delete this[a], l && (this.chart.columnGroup || (this.chart.columnGroup = this.chart.renderer.g("columnGroup").add(l)), this[a] = this.chart.columnGroup, this.chart.columnGroup.attr(this.getPlotBox()), this[a].survive = !0, "group" === a || "markerGroup" === a)) && (arguments[3] = "visible"); return b.apply(this, Array.prototype.slice.call(arguments,
            1))
        }); t(b, "setVisible", function (b, a) { var c = this, d; c.chart.is3d() && c.data.forEach(function (b) { d = (b.visible = b.options.visible = a = "undefined" === typeof a ? !x(c.visible, b.visible) : a) ? "visible" : "hidden"; c.options.data[c.data.indexOf(b)] = b.options; b.graphic && b.graphic.attr({ visibility: d }) }); b.apply(this, Array.prototype.slice.call(arguments, 1)) }); q(a, "afterInit", function () {
            if (this.chart.is3d()) {
                var b = this.options, a = b.grouping, c = b.stacking, d = x(this.yAxis.options.reversedStacks, !0), m = 0; if ("undefined" === typeof a ||
                a) { a = w(this.chart, c); m = b.stack || 0; for (c = 0; c < a[m].series.length && a[m].series[c] !== this; c++); m = 10 * (a.totalStacks - a[m].position) + (d ? c : -c); this.xAxis.reversed || (m = 10 * a.totalStacks - m) } b.depth = b.depth || 25; this.z = this.z || 0; b.zIndex = m
            }
        }); t(b, "pointAttribs", n); t(b, "setState", l); t(b.pointClass.prototype, "hasNewShapeType", c); d.seriesTypes.columnRange && (q = d.seriesTypes.columnrange.prototype, t(q, "pointAttribs", n), t(q, "setState", l), t(q.pointClass.prototype, "hasNewShapeType", c), q.plotGroup = b.plotGroup, q.setVisible =
        b.setVisible); t(u.prototype, "alignDataLabel", function (b, a, c, d, l) { var e = this.chart; d.outside3dPlot = a.outside3dPlot; if (e.is3d() && this.is("column")) { var f = this.options, g = x(d.inside, !!this.options.stacking), k = e.options.chart.options3d, p = a.pointWidth / 2 || 0; f = { x: l.x + p, y: l.y, z: this.z + f.depth / 2 }; e.inverted && (g && (l.width = 0, f.x += a.shapeArgs.height / 2), 90 <= k.alpha && 270 >= k.alpha && (f.y += a.shapeArgs.width)); f = m([f], e, !0, !1)[0]; l.x = f.x - p; l.y = a.outside3dPlot ? -9E9 : f.y } b.apply(this, [].slice.call(arguments, 1)) }); t(v.prototype,
        "getStackBox", function (b, a, c, f, l, p, n, t) { var e = b.apply(this, [].slice.call(arguments, 1)); if (a.is3d() && c.base) { var g = +c.base.split(",")[0], h = a.series[g]; g = a.options.chart.options3d; h && h instanceof d.seriesTypes.column && (h = { x: e.x + (a.inverted ? n : p / 2), y: e.y, z: h.options.depth / 2 }, a.inverted && (e.width = 0, 90 <= g.alpha && 270 >= g.alpha && (h.y += p)), h = m([h], a, !0, !1)[0], e.x = h.x - p / 2, e.y = h.y) } return e }); ""; return a
    }); D(a, "Series/Pie3D/Pie3DPoint.js", [a["Core/Series/SeriesRegistry.js"]], function (a) {
        var q = this && this.__extends ||
        function () { var a = function (d, q) { a = Object.setPrototypeOf || { __proto__: [] } instanceof Array && function (a, d) { a.__proto__ = d } || function (a, d) { for (var n in d) d.hasOwnProperty(n) && (a[n] = d[n]) }; return a(d, q) }; return function (d, q) { function t() { this.constructor = d } a(d, q); d.prototype = null === q ? Object.create(q) : (t.prototype = q.prototype, new t) } }(); a = a.seriesTypes.pie.prototype.pointClass; var u = a.prototype.haloPath; return function (a) {
            function d() { var d = null !== a && a.apply(this, arguments) || this; d.series = void 0; return d }
            q(d, a); d.prototype.haloPath = function () { return this.series.chart.is3d() ? [] : u.apply(this, arguments) }; return d
        }(a)
    }); D(a, "Series/Pie3D/Pie3DSeries.js", [a["Core/Globals.js"], a["Series/Pie3D/Pie3DPoint.js"], a["Core/Series/SeriesRegistry.js"], a["Core/Utilities.js"]], function (a, q, u, C) {
        var d = this && this.__extends || function () {
            var a = function (d, c) { a = Object.setPrototypeOf || { __proto__: [] } instanceof Array && function (b, a) { b.__proto__ = a } || function (b, a) { for (var c in a) a.hasOwnProperty(c) && (b[c] = a[c]) }; return a(d, c) };
            return function (d, c) { function b() { this.constructor = d } a(d, c); d.prototype = null === c ? Object.create(c) : (b.prototype = c.prototype, new b) }
        }(), v = a.deg2rad, t = a.svg; a = C.extend; var w = C.pick; u = function (a) {
            function l() { return null !== a && a.apply(this, arguments) || this } d(l, a); l.prototype.addPoint = function () { a.prototype.addPoint.apply(this, arguments); this.chart.is3d() && this.update(this.userOptions, !0) }; l.prototype.animate = function (c) {
                if (this.chart.is3d()) {
                    var b = this.options.animation; var d = this.center; var m = this.group,
                    l = this.markerGroup; t && (!0 === b && (b = {}), c ? (m.oldtranslateX = w(m.oldtranslateX, m.translateX), m.oldtranslateY = w(m.oldtranslateY, m.translateY), d = { translateX: d[0], translateY: d[1], scaleX: .001, scaleY: .001 }, m.attr(d), l && (l.attrSetters = m.attrSetters, l.attr(d))) : (d = { translateX: m.oldtranslateX, translateY: m.oldtranslateY, scaleX: 1, scaleY: 1 }, m.animate(d, b), l && l.animate(d, b)))
                } else a.prototype.animate.apply(this, arguments)
            }; l.prototype.drawDataLabels = function () {
                if (this.chart.is3d()) {
                    var c = this.chart.options.chart.options3d;
                    this.data.forEach(function (b) { var a = b.shapeArgs, d = a.r, l = (a.start + a.end) / 2; b = b.labelPosition; var e = b.connectorPosition, g = -d * (1 - Math.cos((a.alpha || c.alpha) * v)) * Math.sin(l), n = d * (Math.cos((a.beta || c.beta) * v) - 1) * Math.cos(l);[b.natural, e.breakAt, e.touchingSliceAt].forEach(function (b) { b.x += n; b.y += g }) })
                } a.prototype.drawDataLabels.apply(this, arguments)
            }; l.prototype.pointAttribs = function (c) {
                var b = a.prototype.pointAttribs.apply(this, arguments), d = this.options; this.chart.is3d() && !this.chart.styledMode && (b.stroke =
                d.edgeColor || c.color || this.color, b["stroke-width"] = w(d.edgeWidth, 1)); return b
            }; l.prototype.translate = function () {
                a.prototype.translate.apply(this, arguments); if (this.chart.is3d()) {
                    var c = this, b = c.options, d = b.depth || 0, l = c.chart.options.chart.options3d, n = l.alpha, e = l.beta, g = b.stacking ? (b.stack || 0) * d : c._i * d; g += d / 2; !1 !== b.grouping && (g = 0); c.data.forEach(function (a) {
                        var f = a.shapeArgs; a.shapeType = "arc3d"; f.z = g; f.depth = .75 * d; f.alpha = n; f.beta = e; f.center = c.center; f = (f.end + f.start) / 2; a.slicedTranslation = {
                            translateX: Math.round(Math.cos(f) *
                            b.slicedOffset * Math.cos(n * v)), translateY: Math.round(Math.sin(f) * b.slicedOffset * Math.cos(n * v))
                        }
                    })
                }
            }; return l
        }(u.seriesTypes.pie); a(u, { pointClass: q }); ""; return u
    }); D(a, "Series/Pie3D/Pie3DComposition.js", [a["Series/Pie3D/Pie3DPoint.js"], a["Series/Pie3D/Pie3DSeries.js"], a["Core/Series/SeriesRegistry.js"]], function (a, q, u) { u.seriesTypes.pie.prototype.pointClass.prototype.haloPath = a.prototype.haloPath; u.seriesTypes.pie = q }); D(a, "Series/Scatter3D/Scatter3DPoint.js", [a["Series/Scatter/ScatterSeries.js"], a["Core/Utilities.js"]],
    function (a, q) {
        var u = this && this.__extends || function () { var a = function (d, t) { a = Object.setPrototypeOf || { __proto__: [] } instanceof Array && function (a, d) { a.__proto__ = d } || function (a, d) { for (var l in d) d.hasOwnProperty(l) && (a[l] = d[l]) }; return a(d, t) }; return function (d, t) { function q() { this.constructor = d } a(d, t); d.prototype = null === t ? Object.create(t) : (q.prototype = t.prototype, new q) } }(), G = q.defined; return function (a) {
            function d() { var d = null !== a && a.apply(this, arguments) || this; d.options = void 0; d.series = void 0; return d }
            u(d, a); d.prototype.applyOptions = function () { a.prototype.applyOptions.apply(this, arguments); G(this.z) || (this.z = 0); return this }; return d
        }(a.prototype.pointClass)
    }); D(a, "Series/Scatter3D/Scatter3DSeries.js", [a["Extensions/Math3D.js"], a["Series/Scatter3D/Scatter3DPoint.js"], a["Series/Scatter/ScatterSeries.js"], a["Core/Series/SeriesRegistry.js"], a["Core/Utilities.js"]], function (a, q, u, C, d) {
        var v = this && this.__extends || function () {
            var a = function (d, c) {
                a = Object.setPrototypeOf || { __proto__: [] } instanceof Array &&
                function (a, c) { a.__proto__ = c } || function (a, c) { for (var b in c) c.hasOwnProperty(b) && (a[b] = c[b]) }; return a(d, c)
            }; return function (d, c) { function b() { this.constructor = d } a(d, c); d.prototype = null === c ? Object.create(c) : (b.prototype = c.prototype, new b) }
        }(), t = a.pointCameraDistance; a = d.extend; var w = d.merge; d = function (a) {
            function d() { var c = null !== a && a.apply(this, arguments) || this; c.data = void 0; c.options = void 0; c.points = void 0; return c } v(d, a); d.prototype.pointAttribs = function (c) {
                var b = a.prototype.pointAttribs.apply(this,
                arguments); this.chart.is3d() && c && (b.zIndex = t(c, this.chart)); return b
            }; d.defaultOptions = w(u.defaultOptions, { tooltip: { pointFormat: "x: <b>{point.x}</b><br/>y: <b>{point.y}</b><br/>z: <b>{point.z}</b><br/>" } }); return d
        }(u); a(d.prototype, { axisTypes: ["xAxis", "yAxis", "zAxis"], directTouch: !0, parallelArrays: ["x", "y", "z"], pointArrayMap: ["x", "y", "z"], pointClass: q }); C.registerSeriesType("scatter3d", d); ""; return d
    }); D(a, "Series/Area3DSeries.js", [a["Extensions/Math3D.js"], a["Core/Series/SeriesRegistry.js"], a["Core/Utilities.js"]],
    function (a, q, u) {
        var C = a.perspective; a = q.seriesTypes; var d = a.line, v = u.pick; u = u.wrap; u(a.area.prototype, "getGraphPath", function (a) {
            var q = a.apply(this, [].slice.call(arguments, 1)); if (!this.chart.is3d()) return q; var n = d.prototype.getGraphPath, l = this.options; var c = []; var b = [], p, m = v(l.connectNulls, "percent" === l.stacking), t = Math.round(this.yAxis.getThreshold(l.threshold)); if (this.rawPointsX) for (p = 0; p < this.points.length; p++) c.push({ x: this.rawPointsX[p], y: l.stacking ? this.points[p].yBottom : t, z: this.zPadding });
            this.chart.options && this.chart.options.chart && (l = this.chart.options.chart.options3d, c = C(c, this.chart, !0).map(function (a) { return { plotX: a.x, plotY: a.y, plotZ: a.z } }), this.group && l && l.depth && l.beta && (this.markerGroup && (this.markerGroup.add(this.group), this.markerGroup.attr({ translateX: 0, translateY: 0 })), this.group.attr({ zIndex: Math.max(1, 270 < l.beta || 90 > l.beta ? l.depth - Math.round(this.zPadding || 0) : Math.round(this.zPadding || 0)) }))); c.reversed = !0; c = n.call(this, c, !0, !0); c[0] && "M" === c[0][0] && (c[0] = ["L", c[0][1],
            c[0][2]]); this.areaPath && (c = this.areaPath.splice(0, this.areaPath.length / 2).concat(c), c.xMap = this.areaPath.xMap, this.areaPath = c, n.call(this, b, !1, m)); return q
        })
    }); D(a, "masters/highcharts-3d.src.js", [], function () { })
});
//# sourceMappingURL=highcharts-3d.js.map