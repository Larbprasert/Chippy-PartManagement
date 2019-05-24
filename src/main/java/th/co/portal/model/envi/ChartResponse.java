package th.co.portal.model.envi;

import java.util.List;

public class ChartResponse<T> {
	private List<T> data;

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}
	
}
