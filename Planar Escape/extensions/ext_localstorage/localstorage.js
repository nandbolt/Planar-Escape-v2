
function SaveToLocalStorage(key, value) {
    try {
        localStorage.setItem(key, value);
    } catch (e) {
        console.error("Save failed:", e);
    }
}

function LoadFromLocalStorage(key) {
    try {
        return localStorage.getItem(key);
    } catch (e) {
        console.error("Load failed:", e);
        return "";
    }
}

function DeleteFromLocalStorage(key) {
    try {
        localStorage.removeItem(key);
    } catch (e) {
        console.error("Delete failed:", e);
    }
}
