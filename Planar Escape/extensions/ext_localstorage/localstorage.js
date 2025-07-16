
function SaveToLocalStorage(key, value) {
    try {
        localStorage.setItem(key, value);
		return 1;
    } catch (e) {
        console.error("Save failed:", e);
		return -1;
    }
}

function LoadFromLocalStorage(key) {
    try {
		var data = localStorage.getItem(key);
        return data === null ? "" : data;
    } catch (e) {
        console.error("Load failed:", e);
        return "";
    }
}

function DeleteFromLocalStorage(key) {
    try {
        localStorage.removeItem(key);
		return 1;
    } catch (e) {
        console.error("Delete failed:", e);
		return -1;
    }
}
