#include "object3d.hlsli"

struct Material {
	float32_t4 color;
};

Texture2D<float32_t4> gTexture : register(t0);
SamplerState gSampler : register(s0);
ConstantBuffer<Material> gMaterial : register(b0);

struct PixelShaderOutput {
	float32_t4 color : SV_TARGET0;
};

struct DirectionalLight
{
    float32_t4 color;
    float32_t3 derection;
    float intensity;
};

PixelShaderOutput main(VertexShaderOutput input) {
	PixelShaderOutput output;
	float32_t4 textureColor = gTexture.Sample(gSampler, input.texcoord);
	output.color = gMaterial.color * textureColor;
	return output;
	//harf lambert
    float NdotL = dot(normalize(input.normal), normalize(-gDirectionalLight.direction));
    float cos = pow(NdotL * 0.5f + 0.5f, 2.0f);
}

