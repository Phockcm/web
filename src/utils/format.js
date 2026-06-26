export function formatCurrency(value) {
    if (typeof value !== 'number') {
        const parsed = parseFloat(value);
        if (isNaN(parsed)) return value;
        value = parsed;
    }
    return value.toLocaleString("vi-VN") + "đ";
}
