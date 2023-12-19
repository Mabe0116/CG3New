struct TransformationMatrix {
	float32_t4x4 WVP;
};

StructuredBuffer<TransformationMatrix> gTransformationMatrix : register(t0);
struct VertexShaderOutput {
	float32_t4 position : SV_POSITION;
};
struct VertexShaderInput {
	float32_t4 position : POSITION0;
};
VertexShaderOutput main(VertexShaderInput input,uint32_t instanceId : SV_InstanceID) {
	VertexShaderOutput output;
	output.position = mul(input.position, gTransformationMatrix[instanceId].WVP);
	return output;
}