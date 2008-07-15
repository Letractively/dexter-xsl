/**
 * dexter (c) 2007, 2008 Michael Dykman 
 * Free for use under version 2.0 of the Artistic License.     
 * http://www.opensource.org/licences/artistic-license.php     
 */

package org.dykman.dexter;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;

import org.dykman.dexter.base.DexterEntityResolver;
import org.dykman.dexter.base.DocumentEditor;
import org.dykman.dexter.base.PropertyResolver;
import org.dykman.dexter.base.XSLTDocSequencer;
import org.dykman.dexter.descriptor.Descriptor;
import org.dykman.dexter.descriptor.NodeDescriptor;
import org.dykman.dexter.descriptor.TransformDescriptor;
import org.dykman.dexter.dexterity.DexterityConstants;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class Dexter
{
	static Set<File> outputFile = new HashSet<File>();

	protected Document inputDocument;
	public static String DEXTER_VERSION = "dexter-0.2.0-alpha"; 
	public static String DEXTER_COPYRIGHT = "copyright (c) 2007,2008 Michael Dykman"; 

	private String propertyPath;
	private String filename;

	private String encoding;
	private String indent = "no";
	private String method = "html";
	private String mediaType = "text/html";

//	private String prefix;
	protected Map<Object, Object> userData = new HashMap<Object, Object>();

	protected PropertyResolver baseResolver; 
	protected PropertyResolver entityResolver; 

	protected Map<String,PropertyResolver> modulesMap 
		= new LinkedHashMap<String, PropertyResolver>();

	protected List<String> idNames = new ArrayList<String>();
	private Map<String, String> descriptors = new HashMap<String, String>();
	private Map<String, String> editors = new HashMap<String, String>();
	private Map<String, String> blocks = new HashMap<String, String>();

	/**
	 * construct a Dexter object with default encoding and properties
	 */
	public Dexter()
	{
		this("UTF-8",null);
	}
	/**
	 * construct a Dexter object with specified encoding and default properties
	 */
	public Dexter(String encoding)
	{
		this(encoding, null);
	}

	/**
	 * construct a Dexter object with specified encoding and properties
	 */
	public Dexter(String encoding, Properties properties)
	{
		this.encoding = encoding;
		initializeProperties(properties == null ? loadBuiltInProperties() : properties);
		init();
	}

	public Map<String,PropertyResolver> getModules()
	{
		return modulesMap;
	}
	
	public String getEntity(String key)
	{
		return entityResolver.getProperty(key);
	}

/**
 * create a property resolver for each defined module
 * @param properties
 */
	private void initializeProperties(Properties properties)
	{
		try
		{
			entityResolver = new DexterPropertyResolver("dexter.entities",properties,null);
			baseResolver = new DexterPropertyResolver("dexter",properties,null);
			modulesMap.put("dexter", baseResolver);
			// set the search path for modules
			propertyPath = baseResolver.getProperty("module.path");
			
			String ml = baseResolver.getProperty("module");
			if(ml != null)
			{
				String[] mods = ml.split("[,]");
				for(int i = 0; i < mods.length; ++i)
				{
					String fn = mods[i] + ".properties";
					Properties p = searchProperties(fn);
					if(p == null)
					{
						throw new DexterException("unable to find properties for module " + mods[i]);
					}
					else
					{
						PropertyResolver pr = defineModule(mods[i],p);
						String ns = pr.getProperty("namespace");
						baseResolver.setProperty(mods[i], ns);
					}
				}
			}
		}
		catch(IOException e)
		{
			throw new DexterException(e);
		}
  }
/**
 * this searches the module path for a properties file
 * the value of dexter.module.path is treated as c
 * conventional files path: each element is searched in
 * order.  If no matching properties file is found on the
 * module.path, the classpath is searched under 
 *  /org/dykman/dexter/modules/ for a matching file.
 *  It is through the latter mechanism that the built-in
 *  modules 'dexterity' and 'did' are defined.
 * @param name the name of a proerties file
 * @return the properties object, if found
 * @throws IOException
 */	
  private Properties searchProperties(String name)
		throws IOException
	{
		Properties result = null;
		InputStream in = null;
		
		if(propertyPath != null)
		{
			String[] pp = propertyPath.split("[" + File.pathSeparatorChar + "]");
			for(int i = 0; i < pp.length; ++i)
			{
				File f = new File(pp[i],name);
				if(f.exists() && f.canRead())
				{
					in = new FileInputStream(f);
					break;
				}
			}
		}
		if(in == null)
		{
			String cp;
			cp = "/modules/" + name;
			in = getClass().getResourceAsStream(cp);
			if(in == null)
			{
				cp = "/org/dykman/dexter/modules/" + name;
				in = getClass().getResourceAsStream(cp);
			}
		}
		if(in != null)
		{
			result = new Properties();
			result.load(in);
			in.close();
		}
		return result;
	}

	public void init()
	{
		
// attrbiute names to be blessed as ids
		String v = baseResolver.getProperty("node.id");
		String[] b = v.split(",");
		for (int i = 0; i < b.length; ++i)
		{
			idNames.add(b[i]);
		}

		// initialize modules
		Iterator<String> it = modulesMap.keySet().iterator();
		while(it.hasNext())
		{
			String module = it.next();
			PropertyResolver resolver = modulesMap.get(module);
			String ns = resolver.getProperty("namespace");
			String seq = resolver.getProperty("descriptors");

			if(seq != null)
			{
				String[] tk = seq.split(",");
				for (int i = 0; i < tk.length; ++i)
				{
//System.out.println("      descriptor " + tk[i]);			
					String key = "a." + tk[i];
					String klassName = resolver.getProperty(key);
					this.descriptors.put(ns + ':' + tk[i], klassName);
//System.out.println(ns + ':' + tk[i] + "->" + klassName);			
				}
			}
			v = resolver.getProperty("block");
			if (v != null)
			{
				String[] blks = v.split(",");
				for (int i = 0; i < blks.length; ++i)
				{
					String t = "block." + blks[i];
					v = resolver.getProperty(t);
					if (v != null)
					{
						v = ns + ':' + v;
					}
					blocks.put(ns + ':' + blks[i], v);
				}
			}
			v = resolver.getProperty("editors");
			if(v!= null)
			{
				String[] tk = v.split(",");
				for (int i = 0; i < tk.length; ++i)
				{
					String key = "a." + tk[i];
					String klassName = resolver.getProperty(key);
					this.editors.put(ns + ':' + tk[i], klassName);
				}
			}
		}
	}


	public void setIndent(boolean b)
	{
		if(b)	{ indent = "yes"; }
		else { indent = "no"; }
	}

	public void setMethod(String method)
	{
		this.method = method;
	}
	
	public void setMediaType(String type)
	{
		mediaType = type;
	}

	/**
	 * NOTE - if the module has a namespace defined, as is recommended,
	 * the PropertyResolver will be double keyed: by module name and by namespace
	 */
	public PropertyResolver defineModule(String name,Properties properties)
	{
		PropertyResolver pr = new DexterPropertyResolver(name,properties,baseResolver);
		String ns = pr.getProperty("namespace");
		modulesMap.put(ns, pr);
		return pr;
	}
	
	private String[] parseNs(String name)
	{
		String[] result = new String[] { null, name };
		if(name.indexOf(":") != -1)
		{
			result = name.split("[:]",2);
		}
		return result;
	}
	
//	public Object getUserData(Object key)
//	{
//		return userData.get(key);
//	}
//	Map<String, Document> allDocs = new HashMap<String, Document>();
	
	public Map<String, Document> generateXSLT(String filename,Document document) throws Exception
	{
		this.filename = filename;
		Document clone = (Document)document.cloneNode(true);
		document = clone;
		document.normalize();
		
		// search for each modules names space
		Element docel = document.getDocumentElement();
		Iterator<String> it = modulesMap.keySet().iterator();
		while(it.hasNext())
		{
			String mod = it.next();
			String ns = modulesMap.get(mod).getProperty("namespace");
			String nsspec = "xmlns:" + ns;
			if(docel.hasAttribute(nsspec))
			{
				docel.removeAttribute(nsspec);
			}
		}
		// strip the namespace specifier from the template document
		// so it is not propigated to the output
		

		// convert dexter attributes
		scanDocument(document);
		Descriptor descriptor = marshall(document, this);

		XSLTDocSequencer sequencer = new XSLTDocSequencer(this,filename, encoding);
		sequencer.setIdNames(idNames);
		sequencer.runDescriptor(descriptor);
		return sequencer.getDocuments();
	}

	private static Properties loadBuiltInProperties()
	{
		Properties p = new Properties();
		try
		{
			p.load(Dexter.class.getResourceAsStream(DexterityConstants.SCAN_CFG));
			p.load(Dexter.class.getResourceAsStream("HTMLlat1-ent.properties"));
			p.load(Dexter.class.getResourceAsStream("HTMLspecial-ent.properties"));
			p.load(Dexter.class.getResourceAsStream("HTMLsymbol-ent.properties"));		
		}
		catch (IOException e)
		{
			throw new DexterException("unable to load properties: " + e.getMessage(),e);
		}

		return p;
	}

	public boolean isIdName(String name)
	{
		return idNames.contains(name);
	}

	public void blessTree(Node node)
	{
		bless(node);
		NodeList list = node.getChildNodes();
		for (int i = 0; i < list.getLength(); ++i)
		{
			blessTree(list.item(i));
		}
	}

	public void bless(Node node)
	{
		if (node.getNodeType() == Node.ELEMENT_NODE)
		{
			Element element = (Element) node;
			Iterator<String> it = idNames.iterator();
			while (it.hasNext())
			{
				String s = it.next();
				if (element.hasAttribute(s))
				{
					element.setIdAttribute(s, true);
				}
			}
		}
	}


	public void scanDocument() throws Exception
	{
		scanDocument(inputDocument);
	}

	public void scanDocument(Document document) throws Exception
	{
		Document oldDocument = inputDocument;
		this.inputDocument = document;
		Element root = inputDocument.getDocumentElement();
		blessTree(root); // make ids into 'id's
		
		// find editor attributes, remove them, and
		// run the associated objects on the document
		executeEditors(root); // run the editors
		// find descriptor attributes, remove them and 
		// attach the associated objects 
		compileDescriptors(document); // find descriptor attributes and associate
		inputDocument = oldDocument;
	}

	public void compileDescriptors(Node node) throws Exception
	{
		compileNode(node);
		NodeList children = node.getChildNodes();
		if (children != null)
		{
			for (int i = 0; i < children.getLength(); ++i)
			{
				Node child = children.item(i);
				if (child == null)
				{
					System.out.println("INFO: child removed by earier process");
				}
				else if (child.getParentNode() == null)
				{
					System.out.println("INFO: child has no parent removed by earier process");
				}
				else
				{
					compileDescriptors(child);
				}
			}
		}
	}

	protected void executeEditors(Element element) throws Exception
	{
		scanForEditors(element);
		NodeList children = element.getChildNodes();
		for (int i = 0; i < children.getLength(); ++i)
		{
			Node n = children.item(i);
			if (n.getNodeType() == Node.ELEMENT_NODE)
			{
				executeEditors((Element) n);
			}
		}
	}

	protected void scanForEditors(Element el) throws Exception
	{
		Iterator<String> it = editors.keySet().iterator();
		while (it.hasNext()) // for each editor in the list
		{
			String alabel = it.next();
			if (el.hasAttribute(alabel))
			{
				String vv = el.getAttribute(alabel);
				String[] bb = parseNs(alabel);
				String namespace = bb[0];

//System.out.println("trying to load editor				
				Class klass = Class.forName(editors.get(alabel));
				DocumentEditor editor = (DocumentEditor) klass.newInstance();
				editor.setPropertyResolver(modulesMap.get(namespace));
				editor.setDexter(this);
				editor.setReference(el.getOwnerDocument(), el);
				editor.edit(namespace,alabel, vv);
				el.removeAttribute(alabel);
			}
		}
	}

	public TransformSpecifier createSpecifier(Element element, String label) throws Exception
	{
		TransformSpecifier td = null;
		String k = descriptors.get(label);
		Class cl = Class.forName(k);
		String []bb = parseNs(label);
		String namespace = bb[0];
		String localname = bb[1];

		if (blocks.containsKey(label))
		{
			String end = blocks.get(label);

			Node parent = element.getParentNode();

			Element[] siblings = findContiguousSiblings(element, label, end, false);

			Element blockNode = inputDocument
			      .createElement(DexterityConstants.BLOCK);
			parent.replaceChild(blockNode, element);
			element = blockNode;
			// prepare the args
			String[] names = new String[siblings.length];
			String[] values = new String[siblings.length];

			for (int i = 0; i < siblings.length; ++i)
			{
				Element be = siblings[i];
				if (be.hasAttribute(label))
				{
					names[i] = localName(label);
					values[i] = be.getAttribute(label);
					be.removeAttribute(label);
				}
				else if (end != null && be.hasAttribute(end))
				{
					names[i] = localName(end);
					values[i] = be.getAttribute(end);
					be.removeAttribute(end);
				}
				compileDescriptors(be);
				blockNode.appendChild(be);
			}
			BlockTransformSpecifier btd = new BlockTransformSpecifier(cl);
			btd.setArgs(namespace,siblings, names, values);
			td = btd;
		}
		else
		{
			td = new TransformSpecifier(cl);
			td.setArg(namespace,element, label, element.getAttribute(label));
			element.removeAttribute(label);
		}
		td.setDexter(this);
		td.setPropertyResolver(modulesMap.get(namespace));
		addSpecifier(element, td);
		return td;
	}
	private String localName(String name)
	{
		String result = name;
		if(name.indexOf(':')!= -1)
		{
			String[] bb = name.split("[:]");
			result = bb[1];
		}
		return result;
	}
	protected void scanForDescriptors(Element el) throws Exception
	{
		Iterator<String> it = descriptors.keySet().iterator();
		while (it.hasNext()) // for each decriptor in the list
		{
			String alabel = it.next();
			if (el.hasAttribute(alabel))
			{
				TransformSpecifier td = createSpecifier(el, alabel);
			}
		}
	}

	public static void addSpecifier(Element element, TransformSpecifier specifier)
	{
		List list = (List) element.getUserData(DexterityConstants.DEXTER_SPECIFIERS);
		if (list == null)
		{
			list = new LinkedList<TransformSpecifier>();
			element.setUserData(DexterityConstants.DEXTER_SPECIFIERS, list, null);
		}
		list.add(0,specifier);
	}

	public void compileNode(Node node) throws Exception
	{
		if (node.getNodeType() == Node.ELEMENT_NODE)
		{
			Element el = (Element) node;
			scanForDescriptors(el);
		}
	}

	public Element[] findContiguousSiblings(Element el, String keyAttr,
	      String endAttr, boolean remove) throws Exception
	{
		Node parent = el.getParentNode();
		NodeList children = parent.getChildNodes();
		int n = children.getLength();
		Element[] related = new Element[n];
		Node[] drop = new Node[n];
		int dc = 0;
		int c = 0;
		boolean start = false;
		for (int i = 0; i < n; ++i)
		{
			Node child = children.item(i);
			if (child.getNodeType() == Node.ELEMENT_NODE)
			{
				Element ce = (Element) child;
				if (el.isSameNode(ce))
				{
					start = true;
					related[c++] = ce; // already being scanned
				}
				else if (start)
				{
					if (ce.hasAttribute(keyAttr))
					{
						related[c++] = ce;
						drop[dc++] = ce;
					}
					else if (endAttr != null && ce.hasAttribute(endAttr))
					{
						start = false;
						related[c++] = ce;
						drop[dc++] = ce;
						break; // end of the block
					}
					else
					{
						start = false;
						break; // end of the block
					}
				}
			}
			else if (start)
			{
				if (child.getNodeType() != Node.TEXT_NODE)
				{
					reportInternalError("dropping non-text nodes between siblings",null);
				}
				else if (child.getNodeValue().trim().length() != 0)
				{
					System.err.println(
							"WARNING: dropping non-empty text nodes between siblings" +
					      		"in block section...");
					System.err.print("-->> ");
					System.err.print(child.getNodeValue().trim());
					System.err.println(" <<--");
				}
				drop[dc++] = child;
			}
		}

		for (int i = 0; i < dc; ++i)
		{
			parent.removeChild(drop[i]);
		}
		return Arrays.copyOfRange(related, 0, c);
	}

	private void putToDisk(String name, Document doc) throws Exception
	{
		File f  = new File(name);

		if (outputFile.contains(f))
		{
			throw new DexterException("duplicate output names: " + f.getPath());
		}
		else
		{
			outputFile.add(f);
		}

		Writer writer = new FileWriter(f);

		write(doc, writer, encoding);
		writer.close();
	}

	private TransformerFactory factory = TransformerFactory.newInstance();

	protected void write(Document document, Writer writer, String encoding)
	{
		try
		{

			document.normalizeDocument();

			Transformer tranformer = factory.newTransformer();
			tranformer.setOutputProperty("indent", indent);
			tranformer.setOutputProperty("method", method);
			tranformer.setOutputProperty("media-type", mediaType);
			tranformer.setOutputProperty("encoding", encoding);

			// Writer writer = null;
			Result result = new javax.xml.transform.stream.StreamResult(writer);

			Source source = new javax.xml.transform.dom.DOMSource(document);
			tranformer.transform(source, result);
		}
		catch (Exception e)
		{
			throw new DexterException("error while rendering document",e);
			
		}
	}

	public static Descriptor marshallNode(Node node,Dexter dexter)
   {
   	Descriptor descriptor = new NodeDescriptor(node);
   	List<NodeSpecifier> list = (List<NodeSpecifier>) node
   	      .getUserData(DexterityConstants.DEXTER_SPECIFIERS);
   	if (list != null)
   	{
   		Iterator<NodeSpecifier> it = list.iterator();
   		TransformDescriptor td;
   		while (it.hasNext())
   		{
   			NodeSpecifier specifier = it.next();
   			descriptor = td = specifier.enclose(descriptor);
   		}
   	}
   	return descriptor;
   }

	public static Descriptor marshall(Node node,Dexter dexter)
	{
		Descriptor parent = Dexter.marshallNode(node,dexter);
		Descriptor c;
		NodeList children = node.getChildNodes();
		int nc = children.getLength();
		for (int i = 0; i < nc; ++i)
		{
			Node child = children.item(i);
			if(child != null &&	child.getParentNode() != null)
			{
				c = marshall(child,dexter);
				parent.appendChild(c);
			}
		}
		return parent;
	}

	public static void reportInternalError(String msg, Exception ex)
	{
		PrintStream out = System.err;
		out.println("!!!! An internal error has occured: `" + msg + "' !!!!");
		out.println("    please send an error report to michael@dykman.org with the word ");
		out.println("    'DEXTER-INTERNAL' in the subject line including the following information: ");
		out.println("       * the dexter version number");
		out.println("       * the source file which triggered the error");
		out.println("       * the version the JRE (output of '$ java -version')");
		out.println("       * the full contents of this message ");
		if(ex!=null)
		{
			ex.printStackTrace(out);
		}
		out.println("!!!! end of message !!!!");
	}
	public static void main(String[] args)
	{
		int argp = 0;
		try
		{
			if (args.length == 0)
			{
				System.out.println("please specify an input file");
				System.exit(1);
			}
			String encoding = "UTF-8";
			
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			dbf.setValidating(false);
			DocumentBuilder builder = dbf.newDocumentBuilder();
//			builder.

			builder.setEntityResolver(new DexterEntityResolver(encoding));
			Dexter dexter = new Dexter(encoding);
			dexter.setMediaType("text/html");
			dexter.setMethod("xml");
			dexter.setIndent(true);

			while(argp < args.length)
			{
				String fn = args[argp];
				Document impl = builder.parse(new FileInputStream(fn));
//				dexter.addToAllDocs(dexter.generateXSLT(fn,impl));
				
				Map<String, Document> docs = dexter.generateXSLT(fn,impl);
				++argp;
				Iterator<String> k = docs.keySet().iterator();
				while(k.hasNext())
				{
					String name = k.next();
	 				if(!name.endsWith(".dispose"))
					{
						dexter.putToDisk(name, docs.get(name));
					}
				}
			}
		}
		catch (DexterException e)
		{
			String msg = e.getMessage();
			System.err.println("DexterException: " + msg);
			e.printStackTrace();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	protected static void showHelpFile()
	{
		try
		{
			
			InputStream in = Dexter.class.getResourceAsStream("help.txt");
			BufferedReader read = new BufferedReader(new InputStreamReader(in));
			String  line;
			while((line = read.readLine())!= null)
			{
				System.out.println(line);
			}
		}
		catch(IOException e)
		{
			throw new RuntimeException(e);
		}
	}
}
