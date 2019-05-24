package th.co.baiwa.common.bean;

import java.lang.reflect.Type;
import java.math.BigDecimal;

import com.google.gson.JsonElement;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;

import th.co.baiwa.common.constant.CommonConstants;

public class JsonNumberSerializer implements JsonSerializer<BigDecimal>{
//public class JsonNumberSerializer extends JsonSerializer<BigDecimal> {
	
	private int numbarScale = CommonConstants.NUMBER_SCALE.SCALE_SHOW;
	private int roundScale = BigDecimal.ROUND_HALF_UP;
	
	@Override
	public JsonElement serialize(BigDecimal value, Type typeOfSrc, JsonSerializationContext context) {
		    return new JsonPrimitive(value.setScale(numbarScale, roundScale));
	 }

	public int getNumbarScale() {
		return numbarScale;
	}

	public void setNumbarScale(int numbarScale) {
		this.numbarScale = numbarScale;
	}

	public int getRoundScale() {
		return roundScale;
	}

	public void setRoundScale(int roundScale) {
		this.roundScale = roundScale;
	}
 
	
}
