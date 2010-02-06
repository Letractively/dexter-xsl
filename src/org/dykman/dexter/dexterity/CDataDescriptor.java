package org.dykman.dexter.dexterity;

import org.dykman.dexter.base.PathEval;
import org.dykman.dexter.descriptor.Descriptor;
import org.dykman.dexter.descriptor.PathDescriptor;
import org.w3c.dom.Element;

public class CDataDescriptor extends PathDescriptor
{
	public CDataDescriptor(Descriptor descriptor) {
		super(descriptor);
	}
	@Override
	public void start() {
		sequencer.appendText("<![CDATA[", true);
	}
	@Override
	public void end() {
		sequencer.appendText("]]>", true);
	}
	@Override
	public void children() {
		
		boolean useDefault = false;
		if(value.startsWith("!")) {
			value = value.substring(1);
			useDefault = true;
		}
		if(value.length() > 0) {
		sequencer.copyNodes(new PathEval(value), 
				useDefault ? ((Element)element).getTextContent() : null, true);
		} else {
			super.children();
		}

	}

}
