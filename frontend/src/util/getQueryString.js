const getQueryString = queryState => {
	//한 단계 늦게되네 왜그러징

	const selectedFilters = Object.entries(queryState).filter(
		x => x[0] !== "placeholder" && x[1] !== null
	);

	return selectedFilters.reduce((acc, [key, value], idx) => {
		idx === selectedFilters.length - 1
			? (acc += `${key}=${value}`)
			: (acc += `${key}=${value}&`);
		return acc;
	}, "");
};

export default getQueryString;
