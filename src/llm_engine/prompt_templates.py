class PromptTemplates:
    PERMISSION_VIEW = """Analyze the following Android permissions and generate a Behavioral Summary describing the app's permission-based behavior:

Permissions: {permissions}

Generate a cohesive Behavioral Summary that describes:
1. What sensitive device resources the app accesses (camera, location, contacts, etc.)
2. What system-level capabilities are granted (install packages, system alerts, etc.)
3. The overall privacy risk profile based on permission combinations
4. Function Description: What type of app functionality these permissions suggest

Provide semantic, descriptive text. Do not use bullet points or comma-separated lists."""

    API_VIEW = """Analyze the following API calls and generate a Behavioral Summary describing the app's runtime behavior:

API Calls: {api_calls}

Generate a cohesive Behavioral Summary that describes:
1. What system interactions and external communications the app performs
2. What sensitive operations are executed (file I/O, network, crypto, reflection)
3. The potential security implications of these API patterns
4. Function Description: What behavioral patterns these APIs suggest (gaming, banking, spyware, etc.)

Provide semantic, descriptive text. Do not use bullet points or comma-separated lists."""

    URL_VIEW = """Analyze the following URLs/Components and generate a Behavioral Summary describing external interactions:

URLs/Components: {urls}

Generate a cohesive Behavioral Summary that describes:
1. What external domains, services, or network endpoints the app communicates with
2. What type of data exchange patterns are indicated
3. The trustworthiness and security posture of external connections
4. Function Description: What network behavior this suggests

Provide semantic, descriptive text. Do not use bullet points or comma-separated lists."""

    DIAGNOSTIC_REPORT = """Generate a comprehensive Heuristic Diagnostic Report based on the following Multi-View analysis:

Permission View Summary: {permission_summary}
API View Summary: {api_summary}
URL/Component View Summary: {url_summary}

Synthesize these three views into a unified Heuristic Diagnostic Report that includes:
1. App Behavioral Profile: A semantic description of what this app likely does based on all three views
2. Security Posture: The overall security risk level (Low/Medium/High/Critical) with reasoning
3. Threat Indicators: Specific behaviors that suggest malicious intent
4. Benign Indicators: Behaviors suggesting legitimate functionality
5. Confidence Assessment: How certain the analysis is based on view consistency

This report should be detailed, semantic, and suitable for human review."""

    SINGLE_CONSOLIDATED_REPORT = """Generate a comprehensive Heuristic Diagnostic Report based on the following extracted features:

Permissions: {permissions}
APIs: {api_calls}
URLs/Components: {urls}

Synthesize these features into a unified Heuristic Diagnostic Report that includes:
1. App Behavioral Profile: A semantic description of what this app likely does.
2. Security Posture: The overall security risk level (Low/Medium/High/Critical) with reasoning.
3. Threat Indicators: Specific behaviors that suggest malicious intent.
4. Benign Indicators: Behaviors suggesting legitimate functionality.

This report should be detailed, semantic, and suitable for human review. Do not use bullet points or comma-separated lists for the profile descriptions."""

    FINAL_DIAGNOSTIC_REPORT = """Generate a strict, actionable Heuristic Diagnostic Report based on the following multi-view features and the final Neural Network Classification.

Classification Result: {classification_verdict} (Confidence: {confidence})

Permission View Summary: {permission_summary}
API View Summary: {api_summary}
URL/Component View Summary: {url_summary}

Synthesize these features into a unified Heuristic Diagnostic Report detailing specific risk vectors.
Instructions:
1. Reference explicit APIs, permissions, and domains extracted from the views.
2. Ground all assertions in the extracted feature arrays. Do NOT allow speculative implications.
3. Propose actionable static/dynamic analysis next steps.
4. Structure the report with clear headings: App Behavioral Profile, Threat Indicators, Benign Indicators, Actionable Next Steps.
"""
