const qsParser = url => {
	return url.split("&").map(str => {
		if (str[0] === "?") {
			let d = "";
			for (let i = 1; i < str.length; i++) {
				d += str[i];
			}
			return d.split("=");
		}
		return str.split("=");
	});
};

export default qsParser;
