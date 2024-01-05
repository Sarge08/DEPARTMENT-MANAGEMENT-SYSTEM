﻿/*
 Highcharts JS v10.1.0 (2022-04-29)

 Highcharts Drilldown module

 Author: Torstein Honsi
 License: www.highcharts.com/license

*/
(function (a) { "object" === typeof module && module.exports ? (a["default"] = a, module.exports = a) : "function" === typeof define && define.amd ? define("highcharts/modules/drilldown", ["highcharts"], function (w) { a(w); a.Highcharts = w; return a }) : a("undefined" !== typeof Highcharts ? Highcharts : void 0) })(function (a) {
    function w(a, v, g, p) { a.hasOwnProperty(v) || (a[v] = p.apply(null, g), "function" === typeof CustomEvent && window.dispatchEvent(new CustomEvent("HighchartsModuleLoaded", { detail: { path: v, module: a[v] } }))) } a = a ? a._modules : {}; w(a,
    "Extensions/Breadcrumbs.js", [a["Core/Chart/Chart.js"], a["Core/Globals.js"], a["Core/DefaultOptions.js"], a["Core/Utilities.js"], a["Core/FormatUtilities.js"]], function (a, v, g, p, n) {
        var w = n.format; n = p.addEvent; var C = p.objectEach, F = p.extend, y = p.fireEvent, z = p.merge, x = p.pick, G = p.defined, E = p.isString; F(g.defaultOptions.lang, { mainBreadcrumb: "Main" }); g = function () {
            function a(d, b) {
                this.group = void 0; this.list = []; this.elementList = {}; this.isDirty = !0; this.level = 0; this.options = void 0; b = z(d.options.drilldown && d.options.drilldown.drillUpButton,
                a.defaultBreadcrumbsOptions, d.options.navigation && d.options.navigation.breadcrumbs, b); this.chart = d; this.options = b || {}
            } a.prototype.updateProperties = function (a) { this.setList(a); this.setLevel(); this.isDirty = !0 }; a.prototype.setList = function (a) { this.list = a }; a.prototype.setLevel = function () { this.level = this.list.length && this.list.length - 1 }; a.prototype.getLevel = function () { return this.level }; a.prototype.getButtonText = function (a) {
                var b = this.chart, d = this.options, e = b.options.lang, h = x(d.format, d.showFullPath ? "{level.name}" :
                "\u2190 {level.name}"); e = e && x(e.drillUpText, e.mainBreadcrumb); a = d.formatter && d.formatter(a) || w(h, { level: a.levelOptions }, b) || ""; (E(a) && !a.length || "\u2190 " === a) && G(e) && (a = d.showFullPath ? e : "\u2190 " + e); return a
            }; a.prototype.redraw = function () { this.isDirty && this.render(); this.group && this.group.align(); this.isDirty = !1 }; a.prototype.render = function () {
                var a = this.chart, b = this.options; !this.group && b && (this.group = a.renderer.g("breadcrumbs-group").addClass("highcharts-no-tooltip highcharts-breadcrumbs").attr({ zIndex: b.zIndex }).add());
                b.showFullPath ? this.renderFullPathButtons() : this.renderSingleButton(); this.alignBreadcrumbsGroup()
            }; a.prototype.renderFullPathButtons = function () { this.destroySingleButton(); this.resetElementListState(); this.updateListElements(); this.destroyListElements() }; a.prototype.renderSingleButton = function () {
                var a = this.chart, b = this.list, q = this.options.buttonSpacing; this.destroyListElements(); var e = this.group ? this.group.getBBox().width : q; b = b[b.length - 2]; !a.drillUpButton && 0 < this.level ? a.drillUpButton = this.renderButton(b,
                e, q) : a.drillUpButton && (0 < this.level ? this.updateSingleButton() : this.destroySingleButton())
            }; a.prototype.alignBreadcrumbsGroup = function (a) { if (this.group) { var b = this.options, d = b.buttonTheme, e = b.position, h = "chart" === b.relativeTo || "spacingBox" === b.relativeTo ? void 0 : "scrollablePlotBox", m = this.group.getBBox(); b = 2 * (d.padding || 0) + b.buttonSpacing; e.width = m.width + b; e.height = m.height + b; e = z(e); a && (e.x += a); e.y = x(e.y, this.yOffset, 0); this.group.align(e, !0, h) } }; a.prototype.renderButton = function (a, b, m) {
                var d = this,
                h = this.chart, q = d.options, g = z(q.buttonTheme); b = h.renderer.button(d.getButtonText(a), b, m, function (b) { var e = q.events && q.events.click, m; e && (m = e.call(d, b, a)); !1 !== m && (b.newLevel = q.showFullPath ? a.level : d.level - 1, y(d, "up", b)) }, g).addClass("highcharts-breadcrumbs-button").add(d.group); h.styledMode || b.attr(q.style); return b
            }; a.prototype.renderSeparator = function (a, b) {
                var d = this.chart, e = this.options.separator; a = d.renderer.label(e.text, a, b, void 0, void 0, void 0, !1).addClass("highcharts-breadcrumbs-separator").add(this.group);
                d.styledMode || a.css(e.style); return a
            }; a.prototype.update = function (a) { z(!0, this.options, a); this.destroy(); this.isDirty = !0 }; a.prototype.updateSingleButton = function () { var a = this.chart, b = this.list[this.level - 1]; a.drillUpButton && a.drillUpButton.attr({ text: this.getButtonText(b) }) }; a.prototype.destroy = function () { this.destroySingleButton(); this.destroyListElements(!0); this.group && this.group.destroy(); this.group = void 0 }; a.prototype.destroyListElements = function (a) {
                var b = this.elementList; C(b, function (d, e) {
                    if (a ||
                    !b[e].updated) d = b[e], d.button && d.button.destroy(), d.separator && d.separator.destroy(), delete d.button, delete d.separator, delete b[e]
                }); a && (this.elementList = {})
            }; a.prototype.destroySingleButton = function () { this.chart.drillUpButton && (this.chart.drillUpButton.destroy(), this.chart.drillUpButton = void 0) }; a.prototype.resetElementListState = function () { C(this.elementList, function (a) { a.updated = !1 }) }; a.prototype.updateListElements = function () {
                var a = function (a, b) { return a.getBBox().width + b }, b = this, m = b.elementList,
                e = b.options.buttonSpacing, h = b.list, g = b.group ? a(b.group, e) : e, r; h.forEach(function (d, n) { n = n === h.length - 1; if (m[d.level]) { r = m[d.level]; var p = r.button; r.separator || n ? r.separator && n && (r.separator.destroy(), delete r.separator) : (g += e, r.separator = b.renderSeparator(g, e), g += a(r.separator, e)); m[d.level].updated = !0 } else { p = b.renderButton(d, g, e); g += a(p, e); if (!n) { var q = b.renderSeparator(g, e); g += a(q, e) } m[d.level] = { button: p, separator: q, updated: !0 } } p && p.setState(n ? 2 : 0) })
            }; a.defaultBreadcrumbsOptions = {
                buttonTheme: {
                    fill: "none",
                    height: 18, padding: 2, "stroke-width": 0, zIndex: 7, states: { select: { fill: "none" } }, style: { color: "#335cad" }
                }, buttonSpacing: 5, floating: !1, format: void 0, relativeTo: "plotBox", position: { align: "left", verticalAlign: "top", x: 0, y: void 0 }, separator: { text: "/", style: { color: "#666666" } }, showFullPath: !0, style: {}, useHTML: !1, zIndex: 7
            }; return a
        }(); v.Breadcrumbs || (v.Breadcrumbs = g, n(a, "getMargins", function () {
            var a = this.breadcrumbs; if (a && !a.options.floating && a.level) {
                var d = a.options, b = d.buttonTheme; b = (b.height || 0) + 2 * (b.padding ||
                0) + d.buttonSpacing; d = d.position.verticalAlign; "bottom" === d ? (this.marginBottom = (this.marginBottom || 0) + b, a.yOffset = b) : "middle" !== d ? (this.plotTop += b, a.yOffset = -b) : a.yOffset = void 0
            }
        }), n(a, "redraw", function () { this.breadcrumbs && this.breadcrumbs.redraw() }), n(a, "destroy", function () { this.breadcrumbs && (this.breadcrumbs.destroy(), this.breadcrumbs = void 0) }), n(a, "afterShowResetZoom", function () {
            if (this.breadcrumbs) {
                var a = this.resetZoomButton && this.resetZoomButton.getBBox(), d = this.breadcrumbs.options; a && "right" ===
                d.position.align && "plotBox" === d.relativeTo && this.breadcrumbs.alignBreadcrumbsGroup(-a.width - d.buttonSpacing)
            }
        }), n(a, "selection", function (a) { !0 === a.resetSelection && this.breadcrumbs && this.breadcrumbs.alignBreadcrumbsGroup() })); ""; return g
    }); w(a, "Extensions/Drilldown.js", [a["Core/Animation/AnimationUtilities.js"], a["Core/Axis/Axis.js"], a["Core/Chart/Chart.js"], a["Core/Color/Color.js"], a["Series/Column/ColumnSeries.js"], a["Core/FormatUtilities.js"], a["Core/Globals.js"], a["Core/DefaultOptions.js"], a["Core/Series/Point.js"],
    a["Core/Series/Series.js"], a["Core/Series/SeriesRegistry.js"], a["Core/Renderer/SVG/SVGRenderer.js"], a["Core/Axis/Tick.js"], a["Core/Utilities.js"], a["Extensions/Breadcrumbs.js"]], function (a, v, g, p, n, w, C, M, y, z, x, G, E, m, d) {
        function b(a) { var f = q(this.chart.options.drilldown.animation); a && (a.hide(), I(function () { a && a.added && a.fadeIn() }, Math.max(f.duration - 50, 0))) } var q = a.animObject, e = C.noop; a = M.defaultOptions; var h = m.addEvent, F = m.removeEvent, r = m.extend, A = m.fireEvent, B = m.merge, N = m.objectEach, D = m.pick, I = m.syncTimeout;
        x = x.seriesTypes.pie; var J = 1; r(a.lang, {}); a.drilldown = { activeAxisLabelStyle: { cursor: "pointer", color: "#003399", fontWeight: "bold", textDecoration: "underline" }, activeDataLabelStyle: { cursor: "pointer", color: "#003399", fontWeight: "bold", textDecoration: "underline" }, animation: { duration: 500 }, drillUpButton: { position: { align: "right", x: -10, y: 10 } } }; G.prototype.Element.prototype.fadeIn = function (a) { this.attr({ opacity: .1, visibility: "inherit" }).animate({ opacity: D(this.newOpacity, 1) }, a || { duration: 250 }) }; g.prototype.addSeriesAsDrilldown =
        function (a, c) { this.addSingleSeriesAsDrilldown(a, c); this.applyDrilldown() }; g.prototype.addSingleSeriesAsDrilldown = function (a, c) {
            var f = a.series, k = f.xAxis, b = f.yAxis, t = [], d = [], l; var u = this.styledMode ? { colorIndex: D(a.colorIndex, f.colorIndex) } : { color: a.color || f.color }; this.drilldownLevels || (this.drilldownLevels = []); var g = f.options._levelNumber || 0; (l = this.drilldownLevels[this.drilldownLevels.length - 1]) && l.levelNumber !== g && (l = void 0); c = r(r({ _ddSeriesId: J++ }, u), c); var h = f.points.indexOf(a); f.chart.series.forEach(function (a) {
                a.xAxis !==
                k || a.isDrilling || (a.options._ddSeriesId = a.options._ddSeriesId || J++, a.options._colorIndex = a.userOptions._colorIndex, a.options._levelNumber = a.options._levelNumber || g, l ? (t = l.levelSeries, d = l.levelSeriesOptions) : (t.push(a), a.purgedOptions = B({ _ddSeriesId: a.options._ddSeriesId, _levelNumber: a.options._levelNumber, selected: a.options.selected }, a.userOptions), d.push(a.purgedOptions)))
            }); a = r({
                levelNumber: g, seriesOptions: f.options, seriesPurgedOptions: f.purgedOptions, levelSeriesOptions: d, levelSeries: t, shapeArgs: a.shapeArgs,
                bBox: a.graphic ? a.graphic.getBBox() : {}, color: a.isNull ? p.parse(u.color).setOpacity(0).get() : u.color, lowerSeriesOptions: c, pointOptions: f.options.data[h], pointIndex: h, oldExtremes: { xMin: k && k.userMin, xMax: k && k.userMax, yMin: b && b.userMin, yMax: b && b.userMax }, resetZoomButton: this.resetZoomButton
            }, u); this.drilldownLevels.push(a); k && k.names && (k.names.length = 0); c = a.lowerSeries = this.addSeries(c, !1); c.options._levelNumber = g + 1; k && (k.oldPos = k.pos, k.userMin = k.userMax = null, b.userMin = b.userMax = null); f.type === c.type &&
            (c.animate = c.animateDrilldown || e, c.options.animation = !0)
        }; g.prototype.applyDrilldown = function () { var a = this.drilldownLevels; if (a && 0 < a.length) { var c = a[a.length - 1].levelNumber; this.drilldownLevels.forEach(function (a) { a.levelNumber === c && a.levelSeries.forEach(function (a) { a.options && a.options._levelNumber === c && a.remove(!1) }) }) } this.resetZoomButton && (this.resetZoomButton.hide(), delete this.resetZoomButton); this.pointer.reset(); A(this, "afterDrilldown"); this.redraw(); A(this, "afterApplyDrilldown") }; var K = function (a) {
            var c =
            []; (a = a.drilldownLevels) && a.length && (c[0] || c.push({ level: 0, levelOptions: a[0].seriesOptions }), a.forEach(function (a, f) { a.levelNumber + 1 > c[c.length - 1].level && c.push({ level: a.levelNumber + 1, levelOptions: B({ name: a.lowerSeries.name }, a.pointOptions) }) })); return c
        }; g.prototype.drillUp = function () {
            if (this.drilldownLevels && 0 !== this.drilldownLevels.length) {
                A(this, "beforeDrillUp"); for (var a = this, c = a.drilldownLevels, b = c[c.length - 1].levelNumber, k = c.length, d = a.series, t, e, l, u, g = function (c) {
                d.forEach(function (a) {
                a.options._ddSeriesId ===
                c._ddSeriesId && (f = a)
                }); var f = f || a.addSeries(c, !1); f.type === l.type && f.animateDrillupTo && (f.animate = f.animateDrillupTo); c === e.seriesPurgedOptions && (u = f)
                }, h = a.drilldownLevels.length; k--;) if (e = c[k], e.levelNumber === b) {
                    c.pop(); l = e.lowerSeries; if (!l.chart) for (t = d.length; t--;) if (d[t].options.id === e.lowerSeriesOptions.id && d[t].options._levelNumber === b + 1) { l = d[t]; break } l.xData = []; l.xAxis && l.xAxis.names && (0 === h || k === h) && (l.xAxis.names.length = 0); e.levelSeriesOptions.forEach(g); A(a, "drillup", {
                        seriesOptions: e.seriesPurgedOptions ||
                        e.seriesOptions
                    }); u.type === l.type && (u.drilldownLevel = e, u.options.animation = a.options.drilldown.animation, l.animateDrillupFrom && l.chart && l.animateDrillupFrom(e)); u.options._levelNumber = b; l.remove(!1); u.xAxis && (t = e.oldExtremes, u.xAxis.setExtremes(t.xMin, t.xMax, !1), u.yAxis.setExtremes(t.yMin, t.yMax, !1)); e.resetZoomButton && (a.resetZoomButton = e.resetZoomButton)
                } A(a, "afterDrillUp"); this.redraw(); this.ddDupes && (this.ddDupes.length = 0); A(a, "drillupall")
            }
        }; h(g, "afterInit", function () {
            var a = this; a.drilldown =
            { chart: a, fadeInGroup: b, update: function (c, f) { B(!0, a.options.drilldown, c); D(f, !0) && a.redraw() } }
        }); h(g, "render", function () {
            (this.xAxis || []).forEach(function (a) {
                a.ddPoints = {}; a.series.forEach(function (c) { var f, b = c.xData || [], d = c.points; for (f = 0; f < b.length; f++) { var e = c.options.data[f]; "number" !== typeof e && (e = c.pointClass.prototype.optionsToObject.call({ series: c }, e), e.drilldown && (a.ddPoints[b[f]] || (a.ddPoints[b[f]] = []), e = f - (c.cropStart || 0), a.ddPoints[b[f]].push(d && 0 <= e && e < d.length ? d[e] : !0))) } }); N(a.ticks,
                E.prototype.drillable)
            })
        }); h(C.Breadcrumbs, "up", function (a) { var c = this.chart; a = this.getLevel() - a.newLevel; for (var f = 0; f < a; f++) c.drillUp() }); h(g, "afterDrilldown", function () { var a = this.options.drilldown; a = a && a.breadcrumbs; this.breadcrumbs || (this.breadcrumbs = new d(this, a)); this.breadcrumbs.updateProperties(K(this)) }); h(g, "afterDrillUp", function () { this.breadcrumbs && this.breadcrumbs.updateProperties(K(this)) }); h(g, "update", function (a) {
            var c = this.breadcrumbs, b = a.options.drilldown && a.options.drilldown.breadcrumbs;
            c && b && c.update(a.options.drilldown.breadcrumbs)
        }); n.prototype.animateDrillupTo = function (a) {
            if (!a) {
                var c = this, b = c.drilldownLevel; this.points.forEach(function (a) { var c = a.dataLabel; a.graphic && a.graphic.hide(); c && (c.hidden = "hidden" === c.attr("visibility"), c.hidden || (c.hide(), a.connector && a.connector.hide())) }); I(function () {
                    if (c.points) {
                        var a = []; c.data.forEach(function (c) { a.push(c) }); c.nodes && (a = a.concat(c.nodes)); a.forEach(function (a, c) {
                            c = c === (b && b.pointIndex) ? "show" : "fadeIn"; var f = "show" === c ? !0 : void 0,
                            d = a.dataLabel; if (a.graphic) a.graphic[c](f); d && !d.hidden && (d.fadeIn(), a.connector && a.connector.fadeIn())
                        })
                    }
                }, Math.max(this.chart.options.drilldown.animation.duration - 50, 0)); delete this.animate
            }
        }; n.prototype.animateDrilldown = function (a) {
            var c = this, b = this.chart, f = b.drilldownLevels, d, e = q(b.options.drilldown.animation), g = this.xAxis, l = b.styledMode; a || (f.forEach(function (a) { c.options._ddSeriesId === a.lowerSeriesOptions._ddSeriesId && (d = a.shapeArgs, l || (d.fill = a.color)) }), d.x += D(g.oldPos, g.pos) - g.pos, this.points.forEach(function (a) {
                var b =
                a.shapeArgs; l || (b.fill = a.color); a.graphic && a.graphic.attr(d).animate(r(a.shapeArgs, { fill: a.color || c.color }), e)
            }), b.drilldown && b.drilldown.fadeInGroup(this.dataLabelsGroup), delete this.animate)
        }; n.prototype.animateDrillupFrom = function (a) {
            var c = q(this.chart.options.drilldown.animation), b = this.group, d = b !== this.chart.columnGroup, f = this; f.trackerGroups.forEach(function (a) { if (f[a]) f[a].on("mouseover") }); d && delete this.group; this.points.forEach(function (e) {
                var k = e.graphic, g = a.shapeArgs, h = function () {
                    k.destroy();
                    b && d && (b = b.destroy())
                }; k && g && (delete e.graphic, f.chart.styledMode || (g.fill = a.color), c.duration ? k.animate(g, B(c, { complete: h })) : (k.attr(g), h()))
            })
        }; x && r(x.prototype, {
            animateDrillupTo: n.prototype.animateDrillupTo, animateDrillupFrom: n.prototype.animateDrillupFrom, animateDrilldown: function (a) {
                var c = this.chart.drilldownLevels[this.chart.drilldownLevels.length - 1], b = this.chart.options.drilldown.animation; this.is("item") && (b.duration = 0); if (this.center) {
                    var d = c.shapeArgs, f = d.start, e = (d.end - f) / this.points.length,
                    g = this.chart.styledMode; a || (this.points.forEach(function (a, k) { var h = a.shapeArgs; g || (d.fill = c.color, h.fill = a.color); if (a.graphic) a.graphic.attr(B(d, { start: f + k * e, end: f + (k + 1) * e }))[b ? "animate" : "attr"](h, b) }), this.chart.drilldown && this.chart.drilldown.fadeInGroup(this.dataLabelsGroup), delete this.animate)
                }
            }
        }); y.prototype.doDrilldown = function () { this.runDrilldown() }; y.prototype.runDrilldown = function (a, c, b) {
            var d = this.series.chart, f = d.options.drilldown, e = (f.series || []).length; d.ddDupes || (d.ddDupes = []); for (; e-- &&
            !g;) if (f.series[e].id === this.drilldown && -1 === d.ddDupes.indexOf(this.drilldown)) { var g = f.series[e]; d.ddDupes.push(this.drilldown) } A(d, "drilldown", { point: this, seriesOptions: g, category: c, originalEvent: b, points: "undefined" !== typeof c && this.series.xAxis.getDDPoints(c).slice(0) }, function (c) { var b = c.point.series && c.point.series.chart, d = c.seriesOptions; b && d && (a ? b.addSingleSeriesAsDrilldown(c.point, d) : b.addSeriesAsDrilldown(c.point, d)) })
        }; v.prototype.drilldownCategory = function (a, c) {
            this.getDDPoints(a).forEach(function (b) {
                b &&
                b.series && b.series.visible && b.runDrilldown && b.runDrilldown(!0, a, c)
            }); this.chart.applyDrilldown()
        }; v.prototype.getDDPoints = function (a) { return this.ddPoints && this.ddPoints[a] || [] }; E.prototype.drillable = function () {
            var a = this.pos, c = this.label, b = this.axis, d = "xAxis" === b.coll && b.getDDPoints, e = d && b.getDDPoints(a), g = b.chart.styledMode; d && (c && e && e.length ? (c.drillable = !0, c.basicStyles || g || (c.basicStyles = B(c.styles)), c.addClass("highcharts-drilldown-axis-label"), c.removeOnDrillableClick && F(c.element, "click"),
            c.removeOnDrillableClick = h(c.element, "click", function (c) { c.preventDefault(); b.drilldownCategory(a, c) }), g || c.css(b.chart.options.drilldown.activeAxisLabelStyle)) : c && c.drillable && c.removeOnDrillableClick && (g || (c.styles = {}, c.css(c.basicStyles)), c.removeOnDrillableClick(), c.removeClass("highcharts-drilldown-axis-label")))
        }; h(y, "afterInit", function () { this.drilldown && !this.unbindDrilldownClick && (this.unbindDrilldownClick = h(this, "click", L)); return this }); h(y, "update", function (a) {
            a = a.options || {}; a.drilldown &&
            !this.unbindDrilldownClick ? this.unbindDrilldownClick = h(this, "click", L) : !a.drilldown && void 0 !== a.drilldown && this.unbindDrilldownClick && (this.unbindDrilldownClick = this.unbindDrilldownClick())
        }); var L = function (a) { var c = this.series; c.xAxis && !1 === c.chart.options.drilldown.allowPointDrilldown ? c.xAxis.drilldownCategory(this.x, a) : this.runDrilldown(void 0, void 0, a) }; h(z, "afterDrawDataLabels", function () {
            var a = this.chart.options.drilldown.activeDataLabelStyle, c = this.chart.renderer, b = this.chart.styledMode; this.points.forEach(function (d) {
                var e =
                d.options.dataLabels, f = D(d.dlOptions, e && e.style, {}); d.drilldown && d.dataLabel && ("contrast" !== a.color || b || (f.color = c.getContrast(d.color || this.color)), e && e.color && (f.color = e.color), d.dataLabel.addClass("highcharts-drilldown-data-label"), b || d.dataLabel.css(a).css(f))
            }, this)
        }); var H = function (a, b, d, e) { a[d ? "addClass" : "removeClass"]("highcharts-drilldown-point"); e || a.css({ cursor: b }) }; h(z, "afterDrawTracker", function () {
            var a = this.chart.styledMode; this.points.forEach(function (b) {
                b.drilldown && b.graphic && H(b.graphic,
                "pointer", !0, a)
            })
        }); h(y, "afterSetState", function () { var a = this.series.chart.styledMode; this.drilldown && this.series.halo && "hover" === this.state ? H(this.series.halo, "pointer", !0, a) : this.series.halo && H(this.series.halo, "auto", !1, a) }); h(g, "drillup", function () { this.resetZoomButton && (this.resetZoomButton = this.resetZoomButton.destroy()) }); h(g, "drillupall", function () { this.resetZoomButton && this.showResetZoom() })
    }); w(a, "masters/modules/drilldown.src.js", [], function () { })
});
//# sourceMappingURL=drilldown.js.map