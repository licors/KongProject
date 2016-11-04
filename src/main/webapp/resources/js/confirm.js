function fnConfirmMoveUrl(n, t) {
    return confirm(n) ? (document.location.href = t, !1) : !1
}
