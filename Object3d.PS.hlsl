#include "object3d.hlsli"


struct Material {
	float32_t4 color;
};
ConstantBuffer<Material> gMaterial : register(b0);

Texture2D<float32_t4> gTexture : register(t0);
SamplerState gSampler : register(s0);

struct PixelShaderOutput {
	float32_t4 color : SV_TARGET0;
};

PixelShaderOutput main(VertexShaderOutput input) {
	PixelShaderOutput output;
	output.color = gMaterial.color;

	float32_t4 textureColor = gTexture.Sample(gSampler, input.texcoord);

	output.color = gMaterial.color * textureColor;

	return output;
}

//struct PixelShaderOutput {
//	float32_t4 color : SV_TARGET0;
//};
//
//PixelShaderOutput main() {
//	PixelShaderOutput output;
//	output.color = float32_t4(1.0, 1.0, 1.0, 1.0);
//	return output;
//}

//float4 main() : SV_TARGET
//{
//	return float4(1.0f, 1.0f, 1.0f, 1.0f);
//}